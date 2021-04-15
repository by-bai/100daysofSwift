import UIKit

// 1. writng functions
func printHelp() {
    let message = """
    Welcome to MyApp!
    
    Run this app inside a directory of images and
    MyApp will resize them all into thumbnails
    """
    print(message)
}

printHelp() // call the function


// 2. accepting parameters
print("Hello, world!")

func square(number: Int) { //parameter: int
    print(number * number)
}

square(number: 8)


// 3. returning values
/* if need to return multiple values, can use tuples:
 -> (name: String, age: Int)
 
 or array
 -> [String]
 
 */

func square2(number: Int) -> Int { // -> <return data type>
    return number * number
}

let result = square2(number: 8)
print(result)

func getUser() -> [String] {
    ["Taylor", "Swift"]
}

let user = getUser()
print(user[0])

/* issues with getUser:
 does not specify first name, last name
 */

func getUser2() -> [String: String] {
    ["first": "Taylor", "last": "Swift"]
}

let user2 = getUser2()
print(user2["first"]) // returns nil if "First"

/* issues with getUser2:
 1. dictionary may not contain the value
 2. reading a value from the dictionary requires unwrapping the optional, because Swift can't be sure the value is definitely there
 */

func getUser3() -> (first: String, last: String) {
    (first: "Taylor", last: "Swift")
    
}

let user3 = getUser3()
print(user3.first)

/* why getUser3 is OK:
 1. inserting middle name won't affect the position of other values
 2. will always return a value, either name or empty string
 3. no optionality
 4. can't make case sensitive mistakes while reading values. error is thrown if ".First" */


// 4. parameter labels
func sayHello(to name: String) { //externally "to", internally "name"
    print("Hello, \(name)")
}

sayHello(to: "Taylor")


// 5. omitting parameter labels
func greet(_ person: String) { // underscore in external parameter name
    print("Hello, \(person)!")
}

greet("Taylor")


// 6. default parameters
/* print() has a terminator parameter that uses new line as its default value
 give own parameters a default value by writing an = after its type followed by the default */
func greet(_ person: String, nicely: Bool = true) {
    if nicely == true {
        print("Hello, \(person)!")
    } else {
        print("Oh no, it's \(person) again...")
    }
}

greet("Taylor") // nicely set to true by default, prints nice greetings
greet("Taylor", nicely: false)


// 7. variadic functions
/* variadic functions accept any number of parameters of the same type.
 make any parameter variadic by writing ... after its type
 Int parameter is a single integer
 Int... is zero or more integers - potentially hundreds
 
 print() function is variadic: if you pass lots of parameters,
 they are all printed on one line with spaces between them: */
print("Haters", "gonna", "hate")


func square3(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}

square3(numbers: 1, 2, 3, 4, 5)


// 8. writing throwing functions
/* #1 define an enum that describes the errors we can throw
      based on Swift's existing Error type
   #2 write a function that throws the error */
enum PasswordError: Error {
    case obvious // if user tries an obvious password
}

func checkPassword(_ password: String) throws
    -> Bool { if password == "password" {
        throw PasswordError.obvious
    }
    
    return true
}


// 9. running throwing functions
do {
    try checkPassword("password") // use try before every function that might throw an error
    print("That password is good!") // won't be printed as code will never be reached because the error is thrown
} catch { // catch handles errors gracefully
    print("You can't use that password.")
}


// 10. inout parameters
/* all parameters passed into a Swift function are constants -> can't be changed
   passing parameters as inout means they can be changed inside function
   changes will be reflected in the original value outside the function
 
   when passing inout parameter to a function, use "&" before the parameter name */
func doubleInPlace(number: inout Int) {
    number *= 2
}

var myNum = 10
doubleInPlace(number: &myNum)


