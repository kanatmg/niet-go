package handler

import (
	"encoding/json"
	"github.com/gorilla/mux"
	"github.com/jmoiron/sqlx"
	"github.com/kanatmg/niet-go/pkg/model"
	log "github.com/sirupsen/logrus"
	"net/http"
	"strconv"
)

//todo api/products -> get all products [GET]
func GetProducts(db *sqlx.DB, w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	page := vars["page"]
	currentPage, err := strconv.Atoi(page)
	log.Info(currentPage)
	if err != nil {
		currentPage = 1
	}
	limit := 10
	offset := limit * (currentPage - 1)

	log.Info("Product page: ", currentPage)
	var products []model.Product
	err = db.Select(&products, "select id,title,price,full_price,image,count,shop_id from products limit ? offset ?", limit, offset)
	if err != nil {
		log.Error("Could not select shops table: ", err)
	}
	log.Info("products...")
	log.Info(products)
	response, err := json.Marshal(products)
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
func GetProductById(db *sqlx.DB, w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	id, err := strconv.Atoi(vars["id"])
	if err != nil {
		log.Error("Product id undefined", err)
	}
	var product model.Product

	err = db.Get(&product, "select id,title,price,full_price,image,count,shop_id from products where id=?", id)
	if err != nil {
		log.Error("Could not get product: ", err)
	}
	log.Info("product ->")
	log.Info(product)
	response, err := json.Marshal(product)
	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		w.Write([]byte(err.Error()))
		return
	}
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusOK)
	w.Write([]byte(response))
}

//todo api/shops/{shop}/products ->from single shop get all products [GET]
func GetShopProducts(db *sqlx.DB, w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	id, err := strconv.Atoi(vars["id"])
	if err != nil {
		log.Error("Products id undefined", err)
	}
	var products []model.Product

	err = db.Select(&products, "select id,title,price,full_price,image,count,shop_id from products where shop_id=?", id)
	if err != nil {
		log.Error("Could not get products: %s", err)
	}
	log.Info("products ->")
	log.Info(products)
	response, err := json.Marshal(products)
	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		w.Write([]byte(err.Error()))
		return
	}
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusOK)
	w.Write([]byte(response))
}

//todo api/products/{product} -> update single product [PUT]
//todo api/products/{product} -> delete single product [DELETE]
//todo api/shops/{shop} ->  delete single shop [DELETE]
