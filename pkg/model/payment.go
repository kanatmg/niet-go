package model

type Payment struct {
	Amount               int    `json:"amount"`
	Currency             string `json:"currency"`
	CardHolderName       string `json:"card_holder_name"`
	CardCryptogramPacket string `json:"card_cryptogram_packet"`
}
