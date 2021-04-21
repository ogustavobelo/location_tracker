package main

import (
	"fmt"
	"log"
	"net/http"
	"os"

	"github.com/joho/godotenv"
)

func main() {
	mux := routes()

	log.Println("Starting channel listener...")
	go ListenToWebSocketChannel()

	log.Println("Starting server...")
	log.Fatal(http.ListenAndServe(":"+os.Getenv("PORT"), mux))
}

func init() {
	//Check ENV variables.
	envChecks()
}
func envChecks() {
	err := godotenv.Load(".env")
	if err != nil {
		fmt.Println("Error to load .env")
	}
	port, portExist := os.LookupEnv("PORT")

	if !portExist || port == "" {
		log.Fatal("PORT must be set in .env and not empty")
	}
}
