package config

import (
	"fmt"
)

type configuration struct {
	Server struct {
		Hostname string `required:"true"`
		Port     uint   `required:"true"`
	}
	Security struct {
		JWTSigningKey string `required:"true"`

		EnableFaker bool ``
	}
	Database struct {
		Type     string `default:"mysql"`
		User     string ``
		Password string ``
		Hostname string `default:"localhost"`
		Port     uint   `default:"3306"`
		Name     string `required:"true"`
	}
	CORS struct {
		Origins []string ``
		Headers []string ``
	}
	Mailing struct {
		AccessKeyID     string `required:"true"`
		SecretAccessKey string `required:"true"`
		AWSRegion       string `required:"true"`

		FromEmail               string `required:"true"`
		VerificationTokenLength byte   `default:"8"`
		EnableTestMailer        bool   ``

		WorkerCount     byte `default:"2"`
		WorkerQueueSize uint `default:"255"`
	}
}

func (config configuration) SrvAddr() string {
	return fmt.Sprintf("%s:%d", config.Server.Hostname, config.Server.Port)
}

func (config configuration) DSN() (dsn string) {
	db := config.Database //root:root@tcp(localhost:3306)/story myuser:mypasswd@tcp(127.0.0.1:3306)/mydb
	dsn = fmt.Sprintf("%s:%s@tcp(%s:%d)/%s", db.User, db.Password, db.Hostname, db.Port, db.Name)
	return
}
