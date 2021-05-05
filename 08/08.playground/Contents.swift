import UIKit

/* STRUCTS
 -variables (properties)
 -constants
 -functions
*/


// 1. Creating structs
struct Sport {
    var name: String
}

//create and use an instance of struct
var tennis = Sport(name: "Tennis")
print(tennis.name)

//name and tennis are variables -> can be changed!
tennis.name = "Lawn tennis"


// 2. Computed properties
struct Sport2 {
    //stored properties
    var name: String
    var isOlympicSport: Bool
    
    //computed properties - property that runs code to figure out its value
    var olympicStatus: String {
        if isOlympicSport {
            return "\(name) is an Olympic sport"
        } else {
            return "\(name) is not an Olympic sport"
        }
    }
    
}

let chessBoxing = Sport2(name: "Chessboxing", isOlympicSport: false)
print(chessBoxing.olympicStatus)


// 3. Property observers
//lets us run code before or after any property changes

struct Progress {
    var task: String
    var amount: Int {
        didSet {
            print("\(task) is now \(amount)% complete")
        }
    }
}

//didSet is a property observer : everytime amount changes -> prints a messaeg

var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 30
progress.amount = 80
progress.amount = 100

//willSet can be used to take action BEFORE a property changes


// 4. Methods
struct City {
    var population: Int
    
    func collectTaxes() -> Int {
        return population * 1000
    }
}


let london = City(population: 9_000_000)
london.collectTaxes()


// 5. Mutating methods
//when we want to change a property inside a method, mark with 'mutating'

struct Person {
    var name: String
    
    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}

var person = Person(name: "Ed")
person.makeAnonymous()


// 6. Properties and methods of strings
let string = "Do or do not, there is no try."
print(string.count)
print(string.hasPrefix("Do")) //returns true if string starts with specific letters
print(string.uppercased())
print(string.sorted()) //sort letters into an array


// 7. Properties and methods of arrays
//arrays are also structs, have their own methods and properties we can use to query and manipulate the array
var toys = ["Woody"]
print(toys.count) //count property

toys.append("Buzz")
toys.firstIndex(of: "Buzz") //locate item inside array; returns 1

print(toys.sorted()) //sort array alphabetically
toys.remove(at: 0)
