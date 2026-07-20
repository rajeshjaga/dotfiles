package main

import (
	"fmt"
	"os"
)

func main() {
	fmt.Println("hello world")
	var downs = os.Chdir("/home/jraj/Downloads/")
	fmt.Printf(downs)
}
