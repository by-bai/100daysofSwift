import UIKit

// CLOSURES PART 2


// 1. Using closures as parameters when they accept parameters
func travel(action: (String) -> Void) {
    print("I'm getting ready to go.")
    action("London")
    print("I arrived!")
    
}

travel { (place: String) in
    print("I'm going to \(place) in my car")
}


// 2. Using closures as paramters when they return values
func travel(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}

travel { (place: String) -> String in
    return "I'm going to \(place) in my car"
}


// 3. Shorthand parameter names
func travel2(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}

travel2 { place in
    "I'm going to \(place) in my car"
    
}

travel2 {
    "I'm going to \($0) in my car"
    
}


// ADVANCED CLOSURES

// 4. Closures with multiple parameters
func travel(action: (String, Int) -> String) { //takes in destination and speed, return desc
    print("I'm getting ready to go.")
    let description = action("London", 60)
    print(description)
    print("I arrived!")
    
}

travel {
    "I'm going to \($0) at \($1) miles per hour."
}


// 5. Returning closures from functions
func travel() -> (String) -> Void { // {function's return value} -> {closure's return value}
    return {
        print("I'm going to \($0)")
    }
}
//closure called with a string and return nothing

//call travel() to get back the closure, then call it as a function:
let result = travel()
result("London")


// 6. Capturing values
// if external values are used inside a closure, Swift captures them and stores them alongside the closure, so they can be modified even if they don't exist any more.

//function returns a closure, and the returned closure accepts a string as its only parameter and returns nothing; track how ooften the returned closure is called
func travel2() -> (String) -> Void {
    var counter = 1
    return {
        print("\(counter). I'm going to \($0)")
        counter += 1
    }
}

let result2 = travel2()
result2("London")
result2("London")
result2("London")
//calling result("London") multiple times -> the counter will go up


