package main

import "github.com/gorilla/websocket"

type WebSocketConnection struct {
	*websocket.Conn
}
type WebSocketPayload struct {
	Action string              `json:"action"`
	User   UserModel           `json:"user"`
	Conn   WebSocketConnection `json:"-"`
}

type WebSocketResponse struct {
	Action        string      `json:"action"`
	ConnectedUser []UserModel `json:"connected_users"`
}

type UserModel struct {
	Uid       string        `json:"uid"`
	CreatedAt string        `json:"created_at"`
	Nick      string        `json:"nick"`
	Location  LocationModel `json:"location"`
	Vehicle   string        `json:"vehicle"`
	Visible   bool          `json:"visible"`
	IsWeb     bool          `json:"is_web"`
}

type LocationModel struct {
	Latitutde float64 `json:"latitude"`
	Longitude float64 `json:"longitude"`
	Heading   float64 `json:"heading"`
}
