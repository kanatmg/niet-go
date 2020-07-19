package model

type Shop struct {
	Id            int     `json:"id"`
	Title     	  string  `json:"title"`
	Address       string  `json:"address"`
	Logo 		  string  `json:"logo"`
	PickUpStart   string  `json:"pick_up_start" db:"pick_up_start"`
	PickUpEnd     string  `json:"pick_up_enf"   db:"pick_up_end"`
	PickUpInfo    string  `json:"pick_up_info"  db:"pick_up_info"`
	Contact       string  `json:"contact"`
	Active        bool    `json:"active"`
	AboutUsInfo   string  `json:"about_us_info" db:"about_us_info"`
	CreatedAt     string  `json:"created_at"    db:"created_at"`
	UpdatedAt     string  `json:"updated_at"    db:"updated_at"`
	DeletedAt     string  `json:"deleted_at"    db:"deleted_at"`
}

//func (s *Shop) Create() Shop{
//	return Shop{
//		Id:          0,
//		Title:       "asd",
//		Address:     "asd",
//		Logo:        "asd",
//		PickUpStart: "asdasd",
//		PickUpEnd:   "sada",
//		PickUpInfo:  "asdsad",
//		Contact:     "asd",
//		Active:      true,
//		AboutUsInfo: "asd",
//		CreatedAt:   "ads",
//		UpdatedAt:   "asd",
//		DeletedAt:   "asd",
//	}
//}