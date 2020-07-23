package handler

import (
	"encoding/json"
	"github.com/sirupsen/logrus"
	"net/http"
)

func respondJSON(log *logrus.Logger, w http.ResponseWriter, status int, payload interface{}) {
	response, err := json.Marshal(payload)
	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		_, err = w.Write([]byte(err.Error()))
		if err != nil {
			log.Error("Respond cannot write: ", err)
		}
		log.Error("Respond cannot marshal: ", err)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(status)

	_, err = w.Write(response)
	if err != nil {
		log.Error("Respond cannot write: ", err)
	}
}

func respondError(log *logrus.Logger, w http.ResponseWriter, code int, message string) {
	respondJSON(log, w, code, map[string]string{"error": message})
}
