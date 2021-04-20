package main

import (
	"fmt"
	"log"
	"net/http"

	"github.com/gorilla/websocket"
)

var wsChan = make(chan WebSocketPayload)
var clients = make(map[WebSocketConnection]string)

type WebSocketConnection struct {
	*websocket.Conn
}

var upgradeConnection = websocket.Upgrader{
	ReadBufferSize:  1024,
	WriteBufferSize: 1024,
	CheckOrigin:     func(r *http.Request) bool { return true },
}

type WebSocketPayload struct {
	Action   string              `json:"action"`
	Username string              `json:"username"`
	Uid      string              `json:"uid"`
	Conn     WebSocketConnection `json:"-"`
}

type WebSocketResponse struct {
	Action        string   `json:"action"`
	ConnectedUser []string `json:"connected_users"`
}

func WebSocketEndpoint(w http.ResponseWriter, r *http.Request) {
	ws, err := upgradeConnection.Upgrade(w, r, nil)
	if err != nil {
		log.Println(err)
	}

	log.Println("Client connected to endpoint")

	webSocketResponse := WebSocketResponse{ConnectedUser: make([]string, 0)}

	conn := WebSocketConnection{Conn: ws}
	clients[conn] = ""

	err = ws.WriteJSON(webSocketResponse)
	if err != nil {
		log.Println(err)
	}
	go ListenForWs(&conn)
}

func ListenForWs(conn *WebSocketConnection) {
	defer func() {
		if r := recover(); r != nil {
			log.Println("Error on Listen")
			log.Println("Error:", fmt.Sprintf("%v", r))
		}
	}()

	var payload WebSocketPayload

	for {
		err := conn.ReadJSON(&payload)
		if err == nil {
			payload.Conn = *conn
			wsChan <- payload
		}
	}
}

func ListenToWebSocketChannel() {
	var response WebSocketResponse

	for {
		event := <-wsChan
		switch event.Action {
		case "create_user":
			fmt.Println("create user called!")
			clients[event.Conn] = event.Username
			users := getUsersList()
			response.Action = "list_users"
			response.ConnectedUser = users
			broadcastToAll(response)
		}

	}
}

func getUsersList() []string {
	var userList []string
	for _, client := range clients {
		if client != "" {
			userList = append(userList, client)
		}
	}
	return userList
}

func broadcastToAll(response WebSocketResponse) {
	for client := range clients {
		err := client.WriteJSON(response)
		if err != nil {
			log.Println("WebSocket Error")
			_ = client.Close()
			delete(clients, client)
		}
	}
}

func Home(w http.ResponseWriter, r *http.Request) {
	http.ServeFile(w, r, "./static/web/index.html")
}
