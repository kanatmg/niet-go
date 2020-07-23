package model

import (
	"errors"
	"github.com/badoux/checkmail"
	"github.com/jmoiron/sqlx"
	"github.com/sirupsen/logrus"
	"golang.org/x/crypto/bcrypt"
)

type User struct {
	Id                 int    `json:"id"`
	FullName		   string `json:"full_name" db:"full_name"`
	Email              string `json:"email"`
	EmailVerified      string `json:"email_verified_at" db:"email_verified_at"`
	Password           string `json:"password"`
	Active        	   bool   `json:"active"`
	CreatedAt     	   string `json:"created_at" db:"created_at"`
	UpdatedAt     	   string `json:"updated_at" db:"updated_at"`
	VerificationStatus bool   `json:"verification_status" db:"verification_status"`
}

func (u *User) VerifyPassword(password string) bool {
	return bcrypt.CompareHashAndPassword([]byte(u.Password), []byte(password)) == nil
}

func (u *User) Validate() error {
	if u.Password == "" {
		return errors.New("Required Password")
	}
	if u.Email == "" {
		return errors.New("Required Email")
	}
	if err := checkmail.ValidateFormat(u.Email); err != nil {
		return errors.New("Invalid Email")
	}
	return nil
}

func SetPassword(password string) (string, error) {
	hash, err := bcrypt.GenerateFromPassword([]byte(password), bcrypt.DefaultCost)
	if err != nil {
		return "", errors.New("Invalid Email")
	}
	return string(hash),nil
}

func GetUserByEmail(db *sqlx.DB, log *logrus.Logger, email string) (User, error) {
	var usr User

	err := db.Get(&usr, "select id,full_name,email,email_verified_at,password," +
		"active,created_at,updated_at,verification_status from users where email=?", email)
	log.Error("cannot select user by email", err)

	return usr, err
}

func CreateUser(db *sqlx.DB, log *logrus.Logger, values map[string]interface{}) (User, error){
	var user User

	_, err := db.NamedExec(`INSERT INTO users (full_name,email,password,created_at) VALUES (:full_name,:email,:password,:created_at)`, values)
	if err != nil {
		log.Error("cannot create user ", err)
		return User{}, err
	}

	err = db.Get(&user, "select id,full_name,email,email_verified_at,password," +
		"active,created_at,updated_at,verification_status from users where email=?", values["email"])

	return user, err
}

func CheckEmailDuplication(db *sqlx.DB, log *logrus.Logger, email string) bool {
	rows, err := db.Queryx("SELECT email FROM users where email=?",email)
	if err != nil {
		log.Error("cannot select email")
	}
	if rows == nil {
		return false
	}
	return true
}