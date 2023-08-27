package main

import (
	"fmt"
	"os"
	"strconv"
)

func add(x, y float64) float64 {
	return x + y
}

func subtract(x, y float64) float64 {
	return x - y
}

func multiply(x, y float64) float64 {
	return x * y
}

func divide(x, y float64) (float64, error) {
	if y == 0 {
		return 0, fmt.Errorf("division by zero")
	}
	return x / y, nil
}

func main() {
	if len(os.Args) != 4 {
		fmt.Println("Usage: calculator <number> <operation> <number>")
		return
	}

	x, err := strconv.ParseFloat(os.Args[1], 64)
	if err != nil {
		fmt.Println("Invalid first number:", err)
		return
	}

	operation := os.Args[2]

	y, err := strconv.ParseFloat(os.Args[3], 64)
	if err != nil {
		fmt.Println("Invalid second number:", err)
		return
	}

	var result float64
	switch operation {
	case "+":
		result = add(x, y)
	case "-":
		result = subtract(x, y)
	case "*":
		result = multiply(x, y)
	case "/":
		result, err = divide(x, y)
		if err != nil {
			fmt.Println("Error:", err)
			return
		}
	default:
		fmt.Println("Invalid operation:", operation)
		return
	}

	fmt.Printf("%.2f %s %.2f = %.2f\n", x, operation, y, result)
}

