package main

import (
	"github.com/kanatmg/niet-go/pkg/server"
)

func main() {
	s := server.S()
	s.Initialize()
	s.Start()
}
