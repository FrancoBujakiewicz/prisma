
 package main

 import "fmt"

 func greet(name string) string {
    return "Hello, " + name + "!"
 }

 func main() {

    name := "Alice"
    age := 25

    if age >= 18 {
        fmt.Println(name, "is an adult.")
    } else {
        fmt.Println(name, "is a minor.")
    }

    // Slice (like array) and iteration
    fruits := []string{"apple", "banana", "cherry"}
    for _, fruit := range fruits {
        fmt.Println("I like", fruit)
    }

    // Using the function
    fmt.Println(greet(name))

    // Loop example
    for i := 1; i <= 5; i++ {
        fmt.Println("Counting:", i)
    }
}
