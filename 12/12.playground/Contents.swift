import UIKit

/* OPTIONALS
    data that may or may not be there
 */

// 1. Handling missing data
var age: Int? = nil //optional integer - holds nothing
age = 38


// 2. Unwrapping optionals
var name: String? = nil

//cannot use name.count since the string is nil -- empty memory
//have to unwrap optionals with if let syntax
//if there's a value inside the optional, you can use it
//if there isn't, the condition fails

if let unwrapped = name { //if name holds a string
    print("\(unwrapped.count) letters") //we can read its count property
} else {
    print("Missing name.")
}

// 3. Unwrapping with guard
func greet(_ name: String?) {
    guard let unwrapped = name else {
        print("You didn't provide a name!")
        return
    }
    print("Hello, \(unwrapped)!")
}

//if let vs guard let: unwrapped optional remains usable after the guard code
//using guard let deals with problems at the start of your functions, then exit immediately
//the rest of the function is the happy path


// 4. Force unwrapping "crash operator"
//sometimes we know for sure that a value isn't nil -> force unwrap the optional
//-> convert it from an optional type to a non-optional type
//only force unwrap when you know FOR SURE that it's safe

let str = "5"
let num = Int(str)!
//str = "5" -> gets converted to a regular Int rather than Int?
//str = "Five" -> cannot be converted to an integer -> code crashes


// 5. Implicitly unwrapped optionals
let age2: Int! = nil //! instead of ?
//behaves as if they were already unwrapped -> don't need if let or guard let
//however, if try to use them when they have no value -> code crashes
//why do they exist? -> sometimes a variable will start life as nil, but will always have a value before you need to use it


// 6. Nil coalescing
//unwraps optional and returns the value inside if there is one
//if no value(optional nil) -> a default value is used instead
//value returned is either the value from inside the optional OR default as backup
func username(for id: Int) -> String? {
    if id == 1 {
        return "Taylor Swift"
    } else {
        return nil
    }
}

let user = username(for: 15) ?? "Anonymous" //default value of "Anonymous"
//checks the result that comes back from the username() function
//if string, unwrap
//if nil, "Anonymous"



// 7. Optional chaining
let names = ["John", "Paul", "George", "Ringo"]
let beatle = names.first?.uppercased()
//if first returns nil, no uppercase, beatle set to nil

/*
 a.b.c
 b is optional
 a.b?.c
 Swift checks whether b has value
 if nil, the rest of the line will be ignored and return nil
 if has value, unwrap and execute code
 */


// 8. Optional try

enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }

    return true
}

do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}


/* throwing function
 - do, try, catch
 
 - try?
 * changes throwing functions into functions that return an optional
 * if function throws an error return nil
 * else return value wrapped as an optional
 
 - try!
 * use when you know for sure that the function will not fail
 * if function does throw an error, code will crash
 
 */

if let result = try? checkPassword("password") {
    print("Result was \(result)")
} else {
    print("D'oh.")
}

try! checkPassword("sekrit")
print("OK!")


// 9. Failable initialisers
//an initialiser that might work or might not
//if anything other than nine-letter ID string is passed in, return nil

struct Person {
    var id: String

    init?(id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}

/*
 let str = "5"
 let num = Int(str)
 
 converts string to an integer
 but you might try to pass string there
 gets back an optional integer
 this is an failable initialiser
 can be written in structs/classes
 
 init?() rather than init()
 return nil if something goes wrong
 return value = optional of your type
 */


// 10. Typecasting
class Animal { }
class Fish: Animal { }

class Dog: Animal {
    func makeNoise() {
        print("Woof!")
    }
}

let pets = [Fish(), Dog(), Fish(), Dog()]

for pet in pets {
    if let dog = pet as? Dog {
        dog.makeNoise()
    }
}




