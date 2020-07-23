package model

type Location struct {
	Id        int     `json:"id"`
	Latitude  float32 `json:"latitude"`
	Longitude float32 `json:"longitude"`
	ShopId    int     `json:"shop_id"       db:"shop_id"`
	Active    bool    `json:"active"`
	CreatedAt string  `json:"created_at"    db:"created_at"`
	UpdatedAt string  `json:"updated_at"    db:"updated_at"`
}
