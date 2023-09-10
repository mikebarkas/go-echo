package main

import (
	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
	"net/http"
	"os"
)

func main() {
	e := echo.New()
	e.Use(middleware.Logger())
	e.Use(middleware.Recover())

	e.GET("/", handleIndex)
	e.GET("/json", handleJson)
	e.GET("/param", handleParam)

	httpPort := os.Getenv("PORT")
	if httpPort == "" {
		httpPort = "8080"
	}
	e.Logger.Fatal(e.Start(":" + httpPort))
}

func handleParam(c echo.Context) error {
	p := c.QueryParam("param")
	return c.String(http.StatusOK, "The URL has query param: "+p)
}

func handleJson(c echo.Context) error {
	return c.JSON(http.StatusOK, struct {
		Status string
		Hello  string
	}{Status: "OK", Hello: "Hello from Docker"})
}

func handleIndex(c echo.Context) error {
	return c.HTML(http.StatusOK, "Hello from Docker")
}
