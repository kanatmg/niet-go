package model

type Shop struct {
	Id        int     `json:"id"`
	Title     string  `json:"title"`
	Image     string  `json:"image"`
	Longitude float32 `json:"longitude"`
	Lat       float32 `json:"lat"`
}
