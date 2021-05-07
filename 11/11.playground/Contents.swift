import UIKit

/* PROTOCOLS
    something like Interface in java
    describes what properties and methods something must have
    can inherit multiple protocols
 */

// 1. Protocols
protocol Identifiable {
    var id: String { get set } //id string can be read ("get") or written ("set")
}

struct User: Identifiable {
    var id: String
}

func displayID(thing: Identifiable) { //accepts any Identifiable object
    print("My ID is \(thing.id)")
}


// 2. Protocol inheritance
//Payable requires conforming types to implement a calculateWages() method, NeedsTraining requires conforming types to implement a study() method, etc.
protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}

protocol Employee: Payable, NeedsTraining, HasVacation {}


// 3. Extensions
//add methods to existing types, to make them do things they weren't originally designed to do

extension Int {
    func squared() -> Int {
        return self * self
    }
}

let number = 8
number.squared()

//cannot add stored properties in extensions, have to use computed properties
extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
}


// 4. Protocol extensions
//protocols are like regular extensions
//except rather than extending a specific type like Int
//extend a whole protocol so that all conforming types get your changes

let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"] //Array
let beatles = Set(["John", "Paul", "George", "Ringo"]) //Set

//Array and Set conform to a protocol called Collection
//write extension to that protocol
extension Collection {
    func summarize() {
        print("There are \(count) of us:")

        for name in self {
            print(name)
        }
    }
}

//both Array and Set now have the summarize() method
pythons.summarize()
beatles.summarize()


// 5. Protocol-oriented programming
//protocol extensiosn can provide default implementations for our own protocol methods
protocol Identifiable2 { //conforming types need to have id property & identify() method
    var id: String { get set }
    func identify()
}

extension Identifiable2 { //protocol extensions allow us to provide a default identify() method
    func identify() {
        print("My ID is \(id).")
    }
}

struct User2: Identifiable2 {
    var id: String
}

let bai = User2(id: "bai")
bai.identify()


