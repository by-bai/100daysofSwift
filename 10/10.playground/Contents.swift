import UIKit

/* CLASSES

 classes vs structs
 1. classes: dont come with memberwise initialiser, need to create own initialiser
 2. classes: child class inherit properties and methods of parent/super class
 3. copying:
    copying a struct -> both original and copy are different things
    copying a class -> both the original and copy point to the same things
 4. classes can have deinitialisers: code that runs when an instance of a class is destroyed
 5. dealing with constants:
    constant struct with var property -> can't be changed b/c struct itself is constant
    constant class with var property -> can be changed
    <classes don't need mutating keyword with methods that change properties>

 */

// 1. Creating your own classes
//classes vs structs: classes dont come with memberwise initialiser
class Dog {
    var name: String
    var breed: String
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
    
}

let poppy = Dog(name: "Poppy", breed: "Poodle")


// 2. Class inheritance
class Poodle: Dog { // poodle extends dog
    init(name: String) {
        super.init(name: name, breed: "Poodle") //super.init() calls Dog initialiser
    }
    
}


// 3. Overriding methods
class Dog2 {
    func makeNoise() {
        print("Woof!")
    }
}

class Poodle2 : Dog2 {
    override func makeNoise() {
        print("Yip!")
    }
    
}

let poppy2 = Poodle2()
poppy2.makeNoise() // Poodle2's makeNoise()


// 4. Final classes
//final keyword - declare a class as final & no other class can inherit from it
//cannot override method

final class Dog3 {
    
}


// 5. Copying objects
class Singer {
    var name = "Taylor Swift"
}

var singer = Singer()
print(singer.name)

var singerCopy = singer
singerCopy.name = "Justin Bieber"

//singer and singerCopy points to the same object in memory since Singer is a class

print(singer.name) //class->justin bieber, struct->Taylor Swift


// 6. Deinitialisers
class Person {
    var name = "John Doe"

    init() {
        print("\(name) is alive!")
    }
    
    deinit {
        print("\(name) is no more!")
    }

    func printGreeting() {
        print("Hello, I'm \(name)")
    }
}

//each round of loop: new person created then destroyed
for _ in 1...3 {
    let person = Person()
    person.printGreeting()
}

// 7. Mutability
class Singer2 {
    var name = "Taylor Swift"
}

let taylor = Singer2()
taylor.name = "Ed Sheeran"
print(taylor.name)
//to stop name from being mutable, change from var -> let name = "Taylor Swift" under the class


