package controller

import (
	"net/http"

	"github.com/labstack/echo/v4"
	"github.com/pavani2564/CollegeConnect/backend/service"
)

type Controller struct {
	services service.TestService
}

func NewController(services service.TestService) *Controller {
	return &Controller{
		services,
	}
}

func (c *Controller) GetHello(e echo.Context) error {
	helloText := c.services.GetHello()
	return e.String(http.StatusOK, helloText)
}

func (c *Controller) CreateTest(e echo.Context) error {
	createTest := c.services.CreateTest()
	return e.JSON(http.StatusOK, createTest)
}
