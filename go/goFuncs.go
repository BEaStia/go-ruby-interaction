package main

import "C"
import "time"

//export GoAdd
func GoAdd(a, b C.int) C.int {
	return a + b
}

const shortForm = "2006-Jan-02"

//export ParseShortDate
func ParseShortDate(a *C.char) C.int {
	_date := C.GoString(a)
	t, _ := time.Parse(shortForm, _date)
	return C.int(t.Day())
}

func main() {} // Required but ignored