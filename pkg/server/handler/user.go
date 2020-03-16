package handler

type User struct {
	Id   int
	Name string
}

//func getUsers(db *sqlx.DB) (error, echo.HandlerFunc) {
//	db.Select(&user, "select id,name from users")
//	fmt.Println("users...")
//	fmt.Println(user)
//
//	return c.JSON(http.StatusOK, user)
//}
//func getUsers() error {
//	//id, _ := strconv.Atoi(c.Param("id"))
//	return c.JSON(http.StatusOK, User{12,"asdas"})
//}

//func getUserById(c echo.Context,db *sqlx.DB) error {
//
//	user := []User{}
//	userone := User{}
//
//	id,_ := strconv.Atoi(c.Param("id"))
//	err := db.Get(&userone, "select id,name from users where id=?",id)
//	if err != nil {
//		fmt.Println("empty")
//	}
//	fmt.Println(userone)
//	return c.JSON(http.StatusOK, userone)
//}
//
