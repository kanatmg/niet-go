package handler

import (
	"bytes"
	"encoding/json"
	"fmt"
	"github.com/jmoiron/sqlx"
	"github.com/kanatmg/niet-go/config/cloudpayments"
	"github.com/kanatmg/niet-go/pkg/model"
	"github.com/sirupsen/logrus"
	"io/ioutil"
	"net/http"
)

const (
	CLOUDPAYMENTS_CHARGE_URL       = "https://api.cloudpayments.ru/payments/cards/charge"
	CLOUDPAYMENTS_AUTH_URL         = "https://api.cloudpayments.ru/payments/cards/auth"
	ClOUDPAYMENTS_TOKEN_CHARGE_URL = "https://api.cloudpayments.ru/payments/tokens/charge"
	ClOUDPAYMENTS_TOKEN_AUTH_URL   = "https://api.cloudpayments.ru/payments/tokens/auth"
)

// todo do validation
func Charge(db *sqlx.DB, log *logrus.Logger, w http.ResponseWriter, r *http.Request) {
	body, err := ioutil.ReadAll(r.Body)
	if err != nil {
		w.WriteHeader(http.StatusBadRequest)
		_, err := w.Write([]byte("invalid form values"))
		if err != nil {
			log.Error("Cannot write payment process response")
		}
		log.WithFields(logrus.Fields{"err": err}).Warn("invalid payment process")
		return
	}
	payment := model.Payment{}
	err = json.Unmarshal(body, &payment)
	if err != nil {
		log.WithFields(logrus.Fields{"err": err}).Warn("cannot convert to model")
		return
	}

	client := &http.Client{}

	fmt.Println(payment.Amount)
	fmt.Println(payment.CardCryptogramPacket)
	values := map[string]string{
		"Amount":               "5000",
		"Currency":             payment.Currency,
		"Name":                 payment.CardHolderName,
		"CardCryptogramPacket": payment.CardCryptogramPacket}
	jsonValue, _ := json.Marshal(values)

	req, err := http.NewRequest("POST", CLOUDPAYMENTS_CHARGE_URL, bytes.NewBuffer(jsonValue))
	req.SetBasicAuth(cloudpayments.MERCHANT_PUBLIC_ID, cloudpayments.MERCHANT_API_PASS)
	req.Header.Set("content-type", "application/json")

	fmt.Println(req.Body)
	resp, err := client.Do(req)

	if err != nil {
		log.Fatal(err)
	}
	bodyText, err := ioutil.ReadAll(resp.Body)
	s := string(bodyText)
	//todo 3ds sec implementation
	fmt.Println(s)
}

// todo do 2 stage payment with auth
func Auth(db *sqlx.DB, w http.ResponseWriter, r *http.Request) {
}

// todo payment with token (recrring)
func Token(db *sqlx.DB, w http.ResponseWriter, r *http.Request) {
}
