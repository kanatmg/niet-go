package model

import (
	"github.com/jmoiron/sqlx"
	"github.com/sirupsen/logrus"
	"strconv"
)

type Shop struct {
	Id          int    `json:"id"`
	Title       string `json:"title"`
	Address     string `json:"address"`
	Logo        string `json:"logo"`
	PickUpStart string `json:"pick_up_start" db:"pick_up_start"`
	PickUpEnd   string `json:"pick_up_end"   db:"pick_up_end"`
	PickUpInfo  string `json:"pick_up_info"  db:"pick_up_info"`
	Contact     string `json:"contact"`
	Active      bool   `json:"active"`
	AboutUsInfo string `json:"about_us_info" db:"about_us_info"`
	CreatedAt   string `json:"created_at"    db:"created_at"`
	UpdatedAt   string `json:"updated_at"    db:"updated_at"`
}

func GetShops(db *sqlx.DB, log *logrus.Logger, limit int, offset int) []Shop {
	var shops []Shop

	err := db.Select(&shops, "select id,title,address,logo,pick_up_start,pick_up_end," +
		"pick_up_info,contact,active,about_us_info,created_at,updated_at" +
		" from shops where active=1 limit ? offset ?", limit, offset)
	if err != nil {
		log.Error("Could not select shops table: ", err)
	}

	log.Info(shops)

	return shops
}

func GetShopById(db *sqlx.DB, log *logrus.Logger, id int) Shop {
	var shop Shop

	err := db.Get(&shop, "select id,title,address,logo,pick_up_start,pick_up_end,pick_up_info," +
		"contact,active,about_us_info,created_at,updated_at,updated_at " +
		"from shops where active=1 and id=?", id)
	if err != nil {
		log.Error("Could not get shop: ", err)
	}

	log.Info("shop -> ", shop)

	return shop
}

func GetCurrentPage(page string) (int, int) {
	currentPage, err := strconv.Atoi(page)
	if err != nil {
		currentPage = 1
	}
	if page == "" {
		currentPage = 1
	}

	limit := 10
	offset := limit * (currentPage - 1)

	return limit, offset
}
