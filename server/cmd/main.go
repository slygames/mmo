package main

import (
	"flag"
	"fmt"
	"log"
	"net/http"
	"server/internal/server"
	"server/internal/server/clients"
)

var (
	port = flag.Int("port", 8080, "Port to listen on")
)

func main() {
	flag.Parse() // to use port number

	// Define the game hub
	hub := server.NewHub()

	// Define handler for WebSocket connections
	http.HandleFunc("/ws", func(w http.ResponseWriter, r *http.Request) {
		hub.Serve(clients.NewWebSocketClient, w, r)
	})

	// Run hub in background
	go hub.Run()
	addr := fmt.Sprintf(":%d", *port) // get port addr from command line flag

	log.Printf("Starting server on %s", addr)
	err := http.ListenAndServe(addr, nil) // listen on port addr

	// Show any error
	if err != nil {
		log.Fatalf("Failed to start server: %v", err)
	}
}
