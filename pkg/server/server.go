package server
import(
	"github.com/jmoiron/sqlx"
	"github.com/gorilla/mux"
	"github.com/kanatmg/niet-go/pkg/db"
	log "github.com/sirupsen/logrus"
	"golang.org/x/net/webdav"
	"net/http"
	"github.com/kanatmg/niet-go/config"
)


type server struct {
	Router *mux.Router
	DB     *sqlx.DB
}
type RequestHandlerFunction func(db *sqlx.DB, w http.ResponseWriter, r *http.Request)

func (s *server) Initialize(){
	s.DB = db.ConnectDB()
	s.Router = mux.NewRouter()
	s.setRouters()
}

func (s *server) setRouters(){
	s.Get("/", s.handleRequest(handler))
}

func(s *server) Get(path string, f func(w http.ResponseWriter, r *http.Request)){
	s.Router.HandleFunc(path,f).Methods("GET")
}
func(s *server) Post(path string, f func(w http.ResponseWriter, r *http.Request)){
	s.Router.HandleFunc(path,f).Methods("POST")
}
func(s *server) Put(path string, f func(w http.ResponseWriter, r *http.Request)){
	s.Router.HandleFunc(path,f).Methods("PUT")
}
func(s *server) Delete(path string, f func(w http.ResponseWriter, r *http.Request)){
	s.Router.HandleFunc(path,f).Methods("DELETE")
}
func(s *server) Start(){
	log.Fatal(http.ListenAndServe(config.C().ListenAddr(), s.Router))
}
func (s *server) handleRequest(handler RequestHandlerFunction) http.HandlerFunc{
		return func(w http.ResponseWriter, r *http.Request){
			handler(s.DB,w,r)
		}
}

func S() server{
	return server{}
}
