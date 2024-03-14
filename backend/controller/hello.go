package controller

import (
	"database/sql"
	"net/http"

	"github.com/yourusername/yourapp/service"
	"github.com/labstack/echo/v4"
)

type Controller struct {
	DB *sql.DB
}

func NewController(db *sql.DB) *Controller {
	service.MigrateTables(db)
	return &Controller{db}
}

// Signup handles user signup
func (c *Controller) Signup(ctx echo.Context) error {
	username := ctx.FormValue("username")
	password := ctx.FormValue("password")
	isAdmin := ctx.FormValue("is_admin")

	if username == "" || password == "" {
		return ctx.JSON(http.StatusBadRequest, "Username and password are required")
	}

	var isAdminBool bool
	if isAdmin == "true" {
		isAdminBool = true
	}

	err := service.CreateUser(c.DB, username, password, isAdminBool)
	if err != nil {
		return ctx.JSON(http.StatusInternalServerError, err.Error())
	}

	return ctx.JSON(http.StatusOK, "User created successfully")
}
