package server

import (
	"crypto/tls"
	"github.com/gorilla/mux"
	"github.com/jmoiron/sqlx"
	"github.com/kanatmg/niet-go/config"
	"github.com/kanatmg/niet-go/pkg/db"
	"github.com/kanatmg/niet-go/pkg/logger"
	"github.com/kanatmg/niet-go/pkg/middleware"
	"github.com/kanatmg/niet-go/pkg/server/handler"
	log "github.com/sirupsen/logrus"
	"golang.org/x/crypto/acme/autocert"
	"net/http"
)

type server struct {
	Router *mux.Router
	DB     *sqlx.DB
	log    *log.Logger
}
type RequestHandlerFunction func(db *sqlx.DB, w http.ResponseWriter, r *http.Request)

func (s *server) Initialize() {
	s.DB = db.ConnectDB()
	s.Router = mux.NewRouter()
	s.log = logger.LoggerInit()
	s.setRouters()
}

func (s *server) setRouters() {
	s.Get("/shops", middleware.AuthMiddleware(s.handleRequest(handler.GetShops)))
	s.Post("/login", s.handleRequest(handler.Login))
	s.Post("/payment/charge", s.handleRequest(handler.Charge))
	s.Query("/shops", "page", "{page}", middleware.AuthMiddleware(s.handleRequest(handler.GetShops)))
	//s.Router.HandleFunc("/shops", s.handleRequest(handler.GetShops)).
	//	Queries("page", "{page}").Methods("GET")
	s.Get("/shop/{id}", middleware.AuthMiddleware(s.handleRequest(handler.GetShopById)))
	s.Get("/products", middleware.AuthMiddleware(s.handleRequest(handler.GetProducts)))
	s.Get("/product/{id}", middleware.AuthMiddleware(s.handleRequest(handler.GetProductById)))
	s.Get("/shop/{id}/products", middleware.AuthMiddleware(s.handleRequest(handler.GetShopProducts)))
	//s.Get("/shop/{id}/products", s.handleRequest(handler.GetShopProducts))

}

func (s *server) Get(path string, f func(w http.ResponseWriter, r *http.Request)) {
	s.Router.HandleFunc(path, f).Methods("GET")
}
func (s *server) Post(path string, f func(w http.ResponseWriter, r *http.Request)) {
	s.Router.HandleFunc(path, f).Methods("POST")
}
func (s *server) Put(path string, f func(w http.ResponseWriter, r *http.Request)) {
	s.Router.HandleFunc(path, f).Methods("PUT")
}
func (s *server) Delete(path string, f func(w http.ResponseWriter, r *http.Request)) {
	s.Router.HandleFunc(path, f).Methods("DELETE")
}
func (s *server) Query(path string, key string, value string, f func(w http.ResponseWriter, r *http.Request)) {
	s.Router.HandleFunc(path, f).Queries(key, value).Methods("GET")
}
func (s *server) Start() {
	certManager := autocert.Manager{
		Prompt:     autocert.AcceptTOS,
		HostPolicy: autocert.HostWhitelist(config.C().Server.Domain),
		Cache:      autocert.DirCache(config.C().Ssl.CertDir),
	}
	server := &http.Server{
		Addr:    config.C().Ssl.Port,
		Handler: s.Router,
		TLSConfig: &tls.Config{
			GetCertificate: certManager.GetCertificate,
		},
	}
	go http.ListenAndServe(config.C().SrvAddr(), certManager.HTTPHandler(nil))
	log.Fatal(server.ListenAndServeTLS("", ""))
	//log.Fatal(http.ListenAndServe(config.C().SrvAddr(), s.Router))
}

func (s *server) handleRequest(handler RequestHandlerFunction) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		s.log.WithFields(
			log.Fields{
				"header":    r.Header,
				"remote_ip": r.RemoteAddr,
				"url":       r.URL,
				"body":      r.Body,
			}).Info()
		handler(s.DB, w, r)
	}
}

func S() server {
	return server{}
}
