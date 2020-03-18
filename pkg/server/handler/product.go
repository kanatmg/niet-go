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
	FullPrice float32 `json:"full_price" db:"full_price"`
	Image     string  `json:"image"`
	Count     float32 `json:"count"`
	ShopId    float32 `json:"shop_id" db:"shop_id"`
}

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
	var products []Product
	err = db.Select(&products, "select id,title,price,full_price,image,count,shop_id from products limit ? offset ?", limit, offset)
	if err != nil {
		log.Error("Could not select shops table: %s", err)
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
func GetProductById(db *sqlx.DB, w http.ResponseWriter, r *http.Request){
	vars := mux.Vars(r)
	id, err := strconv.Atoi(vars["id"])
	if err != nil {
		log.Error("Product id undefined", err)
	}
	var product Product

	err = db.Get(&product, "select id,title,price,full_price,image,count,shop_id from products where id=?", id)
	if err != nil {
		log.Error("Could not get product: %s", err)
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
	var products []Product

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

