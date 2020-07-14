package middleware

import (
	log "github.com/sirupsen/logrus"
	"net/http"
)

func AuthMiddleware(next http.HandlerFunc) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		err := TokenValid(r)
		if err != nil {
			w.WriteHeader(http.StatusUnauthorized)
			_, err := w.Write([]byte("Unauthorized"))
			if err != nil {
				log.Error("Cannot write bytes in auth response")
			}
			log.Warn("Unauthorized")
			return
		}
		next(w, r)
	}
}
