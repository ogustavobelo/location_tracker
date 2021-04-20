package main

import (
	"net/http"

	"github.com/bmizerany/pat"
)

func routes() http.Handler {
	mux := pat.New()
	mux.Get("/", http.HandlerFunc(Home))
	mux.Get("/ws", http.HandlerFunc(WebSocketEndpoint))

	fileServer := http.FileServer(http.Dir("./static/web/"))
	mux.Get("/static/web/", http.StripPrefix("/static/web", fileServer))

	return mux
}
