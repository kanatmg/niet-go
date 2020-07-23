package model

import (
	"github.com/jmoiron/sqlx"
	"github.com/sirupsen/logrus"
)

type Product struct {
	Id             int    `json:"id"`
	Title          string `json:"title"`
	Price          int    `json:"price"`
	SalePrice      int    `json:"sale_price"       db:"sale_price"`
	ShopId         int    `json:"shop_id"          db:"shop_id"`
	Status         bool   `json:"status"`
	Image          string `json:"image"`
	Info           string `json:"info"`
	ProductTypeId  int    `json:"product_type_id"  db:"product_type_id"`
	LangId         int    `json:"lang_id"          db:"lang_id"`
	ProductCountId int    `json:"product_count_id" db:"product_count_id"`
	Active         bool   `json:"active"`
	CreatedAt      string `json:"created_at"       db:"created_at"`
	UpdatedAt      string `json:"updated_at"       db:"updated_at"`
}

func GetProducts(db *sqlx.DB, log *logrus.Logger, limit int, offset int) []Product {
	var products []Product
	err := db.Select(&products, "select id,title,price,sale_price,shop_id,status,image,info," +
		"product_type_id,lang_id,product_count_id,active," +
		"created_at,updated_at from products where active=1 limit ? offset ?", limit, offset)
	if err != nil {
		log.Error("Could not select shops table: ", err)
	}
	log.Info("products-> ", products)

	return products
}

func GetProductById(db *sqlx.DB, log *logrus.Logger, id int) Product {
	var product Product

	err := db.Get(&product, "select id,title,price,sale_price,shop_id,status,image,info," +
		"product_type_id,lang_id,product_count_id,active,created_at," +
		"updated_at from products where active=1 and id=?", id)
	if err != nil {
		log.Error("Could not get product: ", err)
	}
	log.Info("product-> ", product)

	return product
}
func GetShopProducts(db *sqlx.DB, log *logrus.Logger, id int) []Product {
	var products []Product

	err := db.Select(&products, "select id,title,price,sale_price,shop_id,status,image,info," +
		"product_type_id,lang_id,product_count_id,active,created_at," +
		"updated_at from products where active=1 and shop_id=?", id)
	if err != nil {
		log.Error("Could not get products: %s", err)
	}
	log.Info("products-> ", products)

	return products
}


