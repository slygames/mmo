package main

import (
	"fmt"
	"server/pkg/packets"

	"google.golang.org/protobuf/proto"
)

func main() {

	packet := &packets.Packet{
		SenderId: 69,
		Msg:      packets.NewChat("Hello World!"),
	}

	fmt.Println(packet)

	bytes := to_bytes(packet)

	from_bytes(bytes)

	fmt.Println("Hello World!")
}

func to_bytes(packet *packets.Packet) []byte {
	data, err := proto.Marshal(packet)
	if err != nil {
		panic(err)
	}
	fmt.Println(data)
	return data
}

func from_bytes(bytes []byte) *packets.Packet {
	packet := &packets.Packet{}
	err := proto.Unmarshal(bytes, packet)
	if err != nil {
		panic(err)
	}
	fmt.Println(packet)
	return packet
}
