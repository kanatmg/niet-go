package config

import (
	"fmt"
)

type configuration struct {
	Server struct {
		Hostname string `required:"true"`
		Port     uint   `required:"true"`
		Domain   string `required:"true"`
		Prod     bool
	}

	Security struct {
		JWTSigningKey string `required:"true"`
		EnableFaker   bool   ``
	}

	Database struct {
		Type     string `default:"mysql"`
		User     string ``
		Password string ``
		Hostname string `default:"localhost"`
		Port     uint   `default:"3306"`
		Name     string `required:"true"`
	}

	Ssl struct {
		Port    string `default:":443"`
		CertDir string `default:"certs"`
	}
}

func (config configuration) SrvAddr() string {
	return fmt.Sprintf("%s:%d", config.Server.Hostname, config.Server.Port)
}

func (config configuration) DSN() (dsn string) {
	db := config.Database
	dsn = fmt.Sprintf("%s:%s@tcp(%s:%d)/%s", db.User, db.Password, db.Hostname, db.Port, db.Name)
	return
}
