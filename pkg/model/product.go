package model

type Product struct {
	Id        int     `json:"id"`
	Title     string  `json:"title"`
	Price     string  `json:"price"`
	FullPrice float32 `json:"full_price" db:"full_price"`
	Image     string  `json:"image"`
	Count     float32 `json:"count"`
	ShopId    float32 `json:"shop_id" db:"shop_id"`
}
