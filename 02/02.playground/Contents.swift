import UIKit

// 1. arrays
let john = "John Lennon"
let paul = "Paul McCartney"
let george = "George Harrison"
let ringo = "Ringo Starr"

let beatles = [john, paul, george, ringo]
beatles[1]
//using type annoations, arrays are written in brackets:
//[String], [Int], [Double], [Bool]


// 2. sets
let colors = Set(["red", "green", "blue"]) // outputs random
let colors2 = Set(["red", "green", "blue", "red"]) // red only appears once


// 3. tuples
var name = (first: "Taylor", last: "Swift")
name.0
name.first
// cannot change types of values e.g. (first: "Justin", age: 25) will get an error

var website1 = (name: "Apple", url: "www.apple.com") // tuple; cannot add date
var website2 = ["Apple", "www.apple.com"] // array

var person = (name: "Paul", age: 40, isMarried: true) // another tuple example


// 4. arrays vs sets vs tuples
let address = (house: 555, street: "Taylor Swift Avenue", city: "Nashville") // tuple
let set = Set(["aardvark", "astronaut", "azalea"]) // set
let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"] // array


// 5. dictionaries
let heights = [
    "Taylor Swift": 1.78,
    "Ed Sheeran": 1.73
]
heights["Taylor Swift"]
//using type annotations, dictionaries are written in brackets with a colon between identifier & value types e.g. [String, Double] and [String: String]


// 6. dictionary default values
let favouriteIceCream = [
    "Paul": "Chocolate",
    "Sophie": "Vanilla"]

favouriteIceCream["Paul"]
favouriteIceCream["Charlotte"] //output: nil
favouriteIceCream["Charlotte", default: "Unknown"]


// 7. creating empty collections
var words = Set<String>()
var numbers = Set<Int>()
var scores = Dictionary<String, Int>()
var results1 = Array<Int>()

//Swift provides special syntax for dictionaries & arrays
var teams = [String: String]()
teams["Paul"] = "Red"

var results2 = [Int]()


// 8. enumerations
let result = "failure"
let result2 = "failed"
let result3 = "fail"

enum Result {
    case success
    case failure
}

let result4 = Result.failure // stops you from accidentally using different strings each time


// 9. enum associated values
enum Activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}

let talking = Activity.talking(topic: "football")


// 10. enum raw values
enum Planet: Int {
    case mercury // 0
    case venus // 1
    case earth // 2
    case mars // 3
}

let earth = Planet(rawValue: 2) // returns earth

enum Planet2: Int {
    case mercury = 1 // 1
    case venus // 2
    case earth // 3
    case mars // 4
}

let venus = Planet2(rawValue: 2) // returns venus
