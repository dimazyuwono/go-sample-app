package main

import (
	"fmt"
	"net/http"
)

func HiWorld(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hi, world!\n")
}

func main() {
	http.HandleFunc("/", HiWorld)
	http.ListenAndServe("0.0.0.0:8080", nil)
}
