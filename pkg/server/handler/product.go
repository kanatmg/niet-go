package handler

import (
	"github.com/gorilla/mux"
	"github.com/jmoiron/sqlx"
	"github.com/kanatmg/niet-go/pkg/model"
	"github.com/sirupsen/logrus"
	"net/http"
	"strconv"
)

func GetProducts(db *sqlx.DB, log *logrus.Logger, w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	page := vars["page"]

	limit, offset := model.GetCurrentPage(page)
	products := model.GetProducts(db, log, limit, offset)

	respondJSON(log, w, http.StatusOK, products)
}

func GetProductById(db *sqlx.DB, log *logrus.Logger, w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	id, err := strconv.Atoi(vars["id"])
	if err != nil {
		log.Error("Product id undefined", err)
	}

	product := model.GetProductById(db, log, id)

	respondJSON(log, w, http.StatusOK, product)
}

func GetShopProducts(db *sqlx.DB, log *logrus.Logger, w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	id, err := strconv.Atoi(vars["id"])
	if err != nil {
		log.Error("Shop Product id undefined", err)
	}

	products := model.GetShopProducts(db, log, id)

	respondJSON(log, w, http.StatusOK, products)

}

//todo api/products/{product} -> update single product [PUT]
//todo api/products/{product} -> delete single product [DELETE]
//todo api/shops/{shop} ->  delete single shop [DELETE]
