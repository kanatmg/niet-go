package model

type Product struct {
	Id                int     `json:"id"`
	Title             string  `json:"title"`
	Price             int     `json:"price"`
	SalePrice         int     `json:"sale_price"       db:"sale_price"`
	ShopId            int     `json:"shop_id"          db:"shop_id"`
	Status            bool    `json:"status"`
	Image             string  `json:"image"`
	Info              string  `json:"info"`
	ProductTypeId     int     `json:"product_type_id"  db:"product_type_id"`
	LangId            int     `json:"lang_id"          db:"lang_id"`
	ProductCountId    int     `json:"product_count_id" db:"product_count_id"`
	Active    		  bool    `json:"active"`
	CreatedAt         string  `json:"created_at"       db:"created_at"`
	UpdatedAt         string  `json:"updated_at"       db:"updated_at"`
}
