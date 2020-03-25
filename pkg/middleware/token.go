package middleware

import (
	"encoding/json"
	"fmt"
	"github.com/dgrijalva/jwt-go"
	"github.com/kanatmg/niet-go/config"
	"github.com/kanatmg/niet-go/pkg/model"
	log "github.com/sirupsen/logrus"
	"net/http"

	"strings"
	"time"
)

func GenerateJWT(user model.User) (string, error) {
	token := jwt.New(jwt.SigningMethodHS256)
	claims := token.Claims.(jwt.MapClaims)
	claims["user_id"] = user.Id
	claims["email"] = user.Email
	claims["exp"] = time.Now().Add(time.Hour * 24).Unix()
	return token.SignedString([]byte(config.C().Security.JWTSigningKey))
}

//func CheckJWT(authToken string) (jwt.MapClaims, error) {
//	// check auth token, step 1
//	token, err := jwt.Parse(authToken, func(token *jwt.Token) (interface{}, error) {
//		if _, ok := token.Method.(*jwt.SigningMethodHMAC); !ok {
//			return nil, fmt.Errorf("Unexpected signing method: %v", token.Header["alg"])
//		}
//		return []byte(config.C().Security.JWTSigningKey), nil
//	})
//	if err != nil {
//		return nil, err
//	}
//
//	// check auth token, step 2
//	if claims, ok := token.Claims.(jwt.MapClaims); !ok || !token.Valid {
//		return nil, errors.New("cannot validate JWT token")
//	} else {
//		return claims, nil
//	}
//}

func TokenValid(r *http.Request) error {
	tokenString := ExtractJWT(r)
	token, err := jwt.Parse(tokenString, func(token *jwt.Token) (interface{}, error) {
		if _, ok := token.Method.(*jwt.SigningMethodHMAC); !ok {
			return nil, fmt.Errorf("Unexpected signing method: %v", token.Header["alg"])
		}
		return []byte(config.C().Security.JWTSigningKey), nil
	})
	if err != nil {
		return err
	}
	if claims, ok := token.Claims.(jwt.MapClaims); ok && token.Valid {
		b, err := json.MarshalIndent(claims, "", " ")
		if err != nil {
			log.Println(err)
		}

		fmt.Println(string(b))
	}
	return nil
}
func ExtractJWT(r *http.Request) string {
	keys := r.URL.Query()
	token := keys.Get("token")
	if token != "" {
		return token
	}
	bearerToken := r.Header.Get("Authorization")
	if len(strings.Split(bearerToken, " ")) == 2 {
		return strings.Split(bearerToken, " ")[1]
	}
	return ""
}

//func findUserByRequest(w http.ResponseWriter, r *http.Request, session *db.Session) *user.User {
//	data, ok := r.Header["Authorization"]
//	if !ok || len(data) != 1 || !strings.Contains(data[0], "bearer ") {
//		w.WriteHeader(http.StatusForbidden)
//		w.Write([]byte("valid Authorization header has not been set"))
//		log.Warn("valid Authorization header has not been set")
//		return nil
//	}
//
//	parts := strings.Split(data[0], " ")
//	if len(parts) != 2 {
//		w.WriteHeader(http.StatusForbidden)
//		w.Write([]byte("valid Authorization header has not been set"))
//		log.Warn("valid Authorization header has not been set")
//		return nil
//	}
//
//	claims, err := user.CheckJWT(parts[1])
//	if err != nil {
//		w.WriteHeader(http.StatusForbidden)
//		w.Write([]byte("check of Authorization header has failed"))
//		log.Warn("check of Authorization header has failed")
//		return nil
//	}
//
//	username, email := claims["username"].(string), claims["email"].(string)
//	if usr, err := user.FindByUsernameAndEmail(username, email, session); err != nil || usr == nil {
//		w.WriteHeader(http.StatusBadRequest)
//		w.Write([]byte("user by given email and/or username cannot be found"))
//		log.WithFields(log.Fields{
//			"err":      err,
//			"username": username,
//			"email":    email,
//		}).Warn("user by given email and/or username cannot be found")
//		return nil
//	} else {
//		return usr
//	}
//}
