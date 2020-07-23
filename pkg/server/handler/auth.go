package handler

import (
	"errors"
	"github.com/jmoiron/sqlx"
	"github.com/kanatmg/niet-go/pkg/middleware"
	"github.com/kanatmg/niet-go/pkg/model"
	"github.com/sirupsen/logrus"
	"net/http"
	"time"
)

var (
	ErrEmptyForm = errors.New("empty forms")
	ErrUnauthorized = errors.New("unauthorized access prohibited")
	ErrJWT = errors.New("cannot create jwt token")
	ErrEmailAlreadyExists = errors.New("email already exits")
)

func Login(db *sqlx.DB, log *logrus.Logger, w http.ResponseWriter, r *http.Request) {

	if err := r.ParseForm(); err != nil {
		respondError(log,w,http.StatusNotFound, err.Error())
		return
	}

	email := r.FormValue("email")
	password := r.FormValue("password")
	if (email == "") || (password=="")  {
		respondError(log,w,http.StatusNotFound,ErrEmptyForm.Error())
	}

	usr, err := model.GetUserByEmail(db, log, email)
	if err != nil {
		respondError(log,w,http.StatusNotFound, err.Error())
		return
	}

	if !usr.VerifyPassword(password) {
		respondError(log,w,http.StatusUnauthorized, ErrUnauthorized.Error())
		return
	}

	token, err := middleware.GenerateJWT(usr)
	if err != nil {
		respondError(log,w,http.StatusInternalServerError, ErrJWT.Error())
		log.Error("unable to generate JWT token:", err)
		return
	}
	respondJSON(log, w, http.StatusOK, token)

}

func Register(db *sqlx.DB, log *logrus.Logger, w http.ResponseWriter, r *http.Request) {

	if err := r.ParseForm(); err != nil {
		respondError(log,w,http.StatusNotFound, err.Error())
		return
	}

	fullName := r.FormValue("full_name")
	email    := r.FormValue("email")
	password := r.FormValue("password")
	if (email == "") || (password=="") || (fullName=="") {
		respondError(log,w,http.StatusNotFound,ErrEmptyForm.Error())
		return
	}

	isEmailExist := model.CheckEmailDuplication(db, log, email)
	if isEmailExist {
		respondError(log,w,http.StatusNotFound, ErrEmailAlreadyExists.Error())
		return
	}

	password, err := model.SetPassword(password)
	if(password == "") || err != nil{
		respondError(log,w,http.StatusInternalServerError, ErrEmptyForm.Error())
		return
	}

	currentTime := time.Now()
	tUnix := currentTime.Unix()

	values := map[string]interface{}{
		"full_name": fullName,
		"email": email,
		"password": password,
		"created_at": time.Unix(tUnix, 0),
	}


	usr, err := model.CreateUser(db, log, values)
	if err != nil {
		respondError(log,w,http.StatusInternalServerError, err.Error())
		return
	}

    //todo email verification

	token, err := middleware.GenerateJWT(usr)
	if err != nil {
		respondError(log,w,http.StatusInternalServerError, ErrJWT.Error())
		log.Error("unable to generate JWT token:", err)
		return
	}
	respondJSON(log, w, http.StatusOK, token)

}

