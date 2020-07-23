package model

type Rate struct {
	ShopId  int    `json:"shop_id"   db:"shop_id"`
	UserId  int    `json:"user_id"   db:"user_id"`
	Value   int    `json:"address"`
	RatedAt string `json:"rated_at"  db:"rated_at"`
}
