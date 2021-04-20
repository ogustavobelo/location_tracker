package main

import (
	"log"
	"net/http"
)

func main() {
	mux := routes()

	log.Println("Starting channel listener...")
	go ListenToWebSocketChannel()

	log.Println("Starting server...")
	log.Fatal(http.ListenAndServe(":8080", mux))
}
