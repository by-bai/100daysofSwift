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
