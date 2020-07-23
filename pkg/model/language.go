package model

type Language struct {
	Id       int    `json:"id"`
	Language string `json:"language"`
	Active   bool   `json:"active"`
}
