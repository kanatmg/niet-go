package db

import (
	_ "github.com/go-sql-driver/mysql"
	"fmt"
	"github.com/jmoiron/sqlx"
	"github.com/kanatmg/niet-go/config"
)

func ConnectDB() *sqlx.DB {
	db, err := sqlx.Connect(config.C().Database.Type,config.C().DSN())
	if err != nil {
		fmt.Errorf("Could not connect database: %s",err)
	}
	return db
}
