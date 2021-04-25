package main

import (
	"fmt"
	"log"
	"net/http"
	"time"

	"github.com/google/uuid"
	"github.com/gorilla/websocket"
)

// const (
// 	dateTimeFormat = "02/Jan/2006 15:04:05"
// )

var wsChan = make(chan WebSocketPayload)
var clients = make(map[WebSocketConnection]UserModel)

var upgradeConnection = websocket.Upgrader{
	ReadBufferSize:  1024,
	WriteBufferSize: 1024,
	CheckOrigin:     func(r *http.Request) bool { return true },
}

func WebSocketEndpoint(w http.ResponseWriter, r *http.Request) {
	ws, err := upgradeConnection.Upgrade(w, r, nil)
	if err != nil {
		log.Println(err)
	}

	log.Println("Client connected to endpoint")

	webSocketResponse := WebSocketResponse{ConnectedUser: make([]UserModel, 0)}

	conn := WebSocketConnection{Conn: ws}
	clients[conn] = UserModel{}

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
			fmt.Println(event.User.Nick)

			userCreated := createNewUser(event.User)
			clients[event.Conn] = userCreated
			event.Conn.WriteJSON(WebSocketResponse{Action: "user_created", ConnectedUser: []UserModel{userCreated}})

			users := getUsersList()
			response.Action = "list_users"
			response.ConnectedUser = users
			broadcastToAll(response)
		case "get_users":
			response.Action = "list_users"
			response.ConnectedUser = getUsersList()
			broadcastToAll(response)
		}

	}
}

func createNewUser(eventUser UserModel) UserModel {
	fmt.Println(eventUser.Nick)
	eventUser.Uid = generateUuid()
	eventUser.CreatedAt = time.Now().Format(time.RFC3339)
	return eventUser
}

func getUsersList() []UserModel {
	var userList []UserModel
	for _, client := range clients {
		if client.Uid != "" {
			userList = append(userList, client)
		}
	}
	return userList
}

func generateUuid() string {
	id := uuid.New().String()
	for _, user := range clients {
		if user.Uid == id {
			return generateUuid()
		}
	}
	return id
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
