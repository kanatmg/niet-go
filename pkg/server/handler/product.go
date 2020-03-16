package handler

import (
	"encoding/json"
	"github.com/gorilla/mux"
	"github.com/jmoiron/sqlx"
	log "github.com/sirupsen/logrus"
	"net/http"
	"strconv"
)

type Product struct {
	Id        int     `json:"id"`
	Title     string  `json:"title"`
	Price     string  `json:"price"`
	FullPrice float32 `json:"full_price"`
	Image       float32 `json:"image"`
	Count       float32 `json:"count"`
	ShopId       float32 `json:"shop_id"`
}
//todo api/products -> get all products [GET]
func getProducts(db *sqlx.DB, w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	page := vars["page"]
	currentPage, err := strconv.Atoi(page)
	log.Info(currentPage)
	if err != nil {
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
//todo api/products/{product} -> get single product [GET]
//todo api/products/{product} -> update single product [PUT]
//todo api/products/{product} -> delete single product [DELETE]
//todo api/shops/{shop} ->  delete single shop [DELETE]
//todo api/shops/{shop}/products ->from single shop get all products [GET]
