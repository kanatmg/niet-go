package db

import (
	_ "github.com/go-sql-driver/mysql"
	"github.com/jmoiron/sqlx"
	"github.com/kanatmg/niet-go/config"
	log "github.com/sirupsen/logrus"
)

func ConnectDB() *sqlx.DB {
	db, err := sqlx.Connect(config.C().Database.Type, config.C().DSN())
	if err != nil {
		log.Error("Could not connect database: ", err)
		log.Fatal(err)
	}
	return db
}
