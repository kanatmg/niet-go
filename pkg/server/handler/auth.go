package handler

import (
	"encoding/json"
	"fmt"
	"github.com/jmoiron/sqlx"
	"github.com/kanatmg/niet-go/pkg/middleware"
	"github.com/kanatmg/niet-go/pkg/model"
	log "github.com/sirupsen/logrus"
	"io/ioutil"
	"net/http"
)

func Login(db *sqlx.DB, w http.ResponseWriter, r *http.Request) {

	body, err := ioutil.ReadAll(r.Body)
	if err != nil {
		w.WriteHeader(http.StatusBadRequest)
		_, err := w.Write([]byte("invalid username and/or password have been provided"))
		if err != nil {
			log.Error("Cannot write login response")
		}
		log.WithFields(log.Fields{"err": err}).Warn("invalid username and/or password have been provided")
		return
	}
	user := model.User{}
	err = json.Unmarshal(body, &user)
	if err != nil {
		log.WithFields(log.Fields{"err": err}).Warn("cannot conver to model")
		return
	}

	usr := model.User{}
	err = db.Get(&usr, "select id,name,surname,email,password,phone from users where email=?", user.Email)
	if err != nil {
		w.WriteHeader(http.StatusBadRequest)
		w.Write([]byte("cannot find email"))
		log.WithFields(log.Fields{"err": err}).Warn("cannot find email")
		return
	}
	fmt.Println(user)
	if !usr.VerifyPassword(user.Password) {
		w.WriteHeader(http.StatusBadRequest)
		_, err := w.Write([]byte("invalid username and/or password have been provided"))
		if err != nil {
			log.Error("Cannot write login response")
		}
		log.WithFields(log.Fields{"err": err}).Warn("invalid username and/or password have been provided")
		return
	}

	if token, err := middleware.GenerateJWT(usr); err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		w.Write([]byte("unable to generate JWT token"))
		log.WithFields(log.Fields{"err": err}).Warn("unable to generate JWT token")
	} else {
		w.Write([]byte(token))
	}
}
