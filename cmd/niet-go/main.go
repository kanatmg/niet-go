package main

import (
    //"net/http"
    log "github.com/sirupsen/logrus"
    "github.com/kanatmg/niet-go/config"
     _ "github.com/go-sql-driver/mysql"
    "github.com/kanatmg/niet-go/pkg/server"

)

func main() {

    log.SetLevel(log.DebugLevel)
    log.Info("Juregin Niet'ke tolsin ;-)")
    log.Info(config.C().ListenAddr())
    s := server.S()
    s.Initialize()
    s.Start()
    log.Info("Bye!")
}