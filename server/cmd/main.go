package main

import (
	"fmt"
	"server/pkg/packets"
)

func main() {

	packet := &packets.Packet{
		SenderId: 69,
		Msg:      packets.NewId(54),
	}

	fmt.Println(packet)

	//fmt.Println("Hello World!")
}
