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
			w.Write([]byte("Unauthorized"))
			log.Warn("Unauthorized")
			return
		}
		next(w, r)
	}
}
