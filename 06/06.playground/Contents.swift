import UIKit

// CLOSURES


// 1. creating basic closures
let driving = {
    print("I'm driving in my car")
}

// call function:
driving()


// 2. Accepting parameters in a closure
let driving2 = { (place: String) in
    print("I'm going to \(place) in my car")
}

driving2("London")


// 3. Returning values from a closure
let drivingWithReturn = { (place: String) -> String in
    return "I'm going to \(place) in my car"
}

let message = drivingWithReturn("London")


// 4. Closures as parameters
// closures, like strings and integers, can be passed into functions.

// to pass closure into a function, specify () -> Void which means:
func travel(action: () -> Void) { // accepts no parameters, and returns Void
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
    
}
// travel(function) accepts different kinds of traveling actionsdd and prints a message before and after.

travel(action: driving)


// 5. trailing closure syntax
func travel2(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}

// since last parameter is a closure, call travel() using trailing closure syntax:
travel2 {
    print("I'm driving in my car")
}




