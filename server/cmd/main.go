package main

import (
	"fmt"
	"server/pkg/packets"
)

func main() {
	//fmt.Println("Hello World!")

	packet := &packets.Packet{
		SenderId: 69,
		Msg: &packets.Packet_Chat{
			Chat: &packets.ChatMessage{
				Msg: "Hello World!",
			},
		},
	}

	fmt.Println(packet)
}
