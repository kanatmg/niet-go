package model

type ProductType struct {
	Id      int     `json:"id"`
	Title   string  `json:"title"`
	LangId  int     `json:"lang_id"  db:"lang_id"`
}
