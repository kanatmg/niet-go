package handler

import (
	"github.com/gorilla/mux"
	"github.com/jmoiron/sqlx"
	"github.com/kanatmg/niet-go/pkg/model"
	"github.com/sirupsen/logrus"
	"net/http"
	"strconv"
)

func GetShops(db *sqlx.DB, log *logrus.Logger, w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	page := vars["page"]

	limit, offset := model.GetCurrentPage(page)
	shops := model.GetShops(db, log, limit, offset)

	respondJSON(log, w, http.StatusOK, shops)
}

func GetShopById(db *sqlx.DB, log *logrus.Logger, w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	id, err := strconv.Atoi(vars["id"])
	if err != nil {
		log.Error("Shop id undefined", err)
	}

	shop := model.GetShopById(db, log, id)
	respondJSON(log, w, http.StatusOK, shop)
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
