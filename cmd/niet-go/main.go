package main

import (
	//"net/http"
	_ "github.com/go-sql-driver/mysql"
	"github.com/kanatmg/niet-go/pkg/server"
	log "github.com/sirupsen/logrus"
)

func main() {
	log.Info("Juregin Niet'ke tolsin ;-)")
	s := server.S()
	s.Initialize()
	s.Start()
	log.Info("Bye!")
}
