package main

import (
	"github.com/kanatmg/niet-go/config"
	"github.com/kanatmg/niet-go/pkg/server"
)

func main() {
	s := server.S()
	s.Initialize()
	if config.C().Server.Prod {
		s.Start()
	} else {
		s.StartLocal()
	}

}
