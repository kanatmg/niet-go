package model

type Favorite struct {
	Id            int     `json:"id"`
	ShopId        int     `json:"shop_id"       db:"shop_id"`
	UserId        int     `json:"user_id"       db:"user_id"`
	Active        bool    `json:"active"`
	FollowedAt    string  `json:"followed_at"   db:"followed_at"`
}
