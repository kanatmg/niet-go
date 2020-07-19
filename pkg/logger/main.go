package logger

import (
	"github.com/kanatmg/niet-go/config"
	"github.com/sirupsen/logrus"
	"os"
)

var log = logrus.New()

func LoggerInit() *logrus.Logger {
	log.SetFormatter(
		&logrus.JSONFormatter{
			PrettyPrint: true,
		})

	file, err := os.OpenFile("nietlogs.log", os.O_CREATE|os.O_WRONLY|os.O_APPEND, 0666)

	if err == nil {
		log.Out = file
	} else {
		log.Info("Failed to log to file, using default stderr")
	}

	log.SetLevel(logrus.DebugLevel)
	log.Info("Juregin Niet'ke tolsin ;-)")
	log.Info(config.C().SrvAddr())

	return log
}
