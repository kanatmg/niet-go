package model

type ProductCount struct {
	Id        int    `json:"id"`
	Count     int    `json:"count"`
	Active    bool   `json:"active"`
	UpdatedAt string `json:"updated_at" db:"updated_at"`
}
