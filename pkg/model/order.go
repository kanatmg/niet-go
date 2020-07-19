package model

type Order struct {
	Id            int     `json:"id"`
	UuId     	  string  `json:"uuid"`
	ProductId     int     `json:"product_id"     db:"product_id"`
	ShopId 		  int     `json:"shop_id"        db:"shop_id"`
	UserId        int     `json:"user_id"        db:"user_id"`
	ProductTotal  int     `json:"product_total"  db:"product_total"`
	ProductCount  int     `json:"product_count"  db:"product_count"`
	Status        int     `json:"status"`
	Active        bool    `json:"active"`
	Checkout      string  `json:"checkout"`
	Payment       string  `json:"payment"`
	CreatedAt     string  `json:"created_at"    db:"created_at"`
	UpdatedAt     string  `json:"updated_at"    db:"updated_at"`
}