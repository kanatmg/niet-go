package handler

import (
	"encoding/json"
	"github.com/gorilla/mux"
	"github.com/jmoiron/sqlx"
	log "github.com/sirupsen/logrus"
	"net/http"
	"strconv"
)

type Shop struct {
	Id        int     `json:"id"`
	Title     string  `json:"title"`
	Image     string  `json:"image"`
	Longitude float32 `json:"longitude"`
	Lat       float32 `json:"lat"`
}

//todo api/shops -> get all shops [GET]
func GetShops(db *sqlx.DB, w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	page := vars["page"]
	currentPage, err := strconv.Atoi(page)
	log.Info(currentPage)
	if err != nil {
		currentPage = 1
	}
	if page == "" {
		currentPage = 1
	}
	limit := 10
	offset := limit * (currentPage - 1)

	log.Info("Shop page: ", currentPage)
	var shops []Shop
	err = db.Select(&shops, "select id,title,image,longitude,lat from shops limit ? offset ?", limit, offset)
	if err != nil {
		log.Error("Could not select shops table: %s", err)
	}
	log.Info("shops...")
	log.Info(shops)
	response, err := json.Marshal(shops)
	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		w.Write([]byte(err.Error()))
		return
	}
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusOK)
	w.Write([]byte(response))
}

//todo api/shops/{shop} -> get single shop [GET]
func GetShopById(db *sqlx.DB, w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	id, err := strconv.Atoi(vars["id"])
	if err != nil {
		log.Error("Shop id undefined", err)
	}
	var shop Shop

	err = db.Get(&shop, "select id,title,image,longitude,lat from shops where id=?", id)
	if err != nil {
		log.Error("Could not get shop: %s", err)
	}
	log.Info("shop ->")
	log.Info(shop)
	response, err := json.Marshal(shop)
	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		w.Write([]byte(err.Error()))
		return
	}
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusOK)
	w.Write([]byte(response))
}

//todo api/shop -> create single shop [POST]
func CreateShop(db *sqlx.DB, w http.ResponseWriter, r *http.Request) {

}

//todo api/shops/{shop} -> update single shop [PUT]
func UpdateShop() {

}

//todo api/shops/{shop} ->  delete single shop [DELETE]
func DeleteShop() {

}
