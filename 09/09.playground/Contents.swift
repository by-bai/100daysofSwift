import UIKit

// STRUCTS PART 2


// 1. Initialisers
struct User {
    var username: String
    
}

var user = User(username: "bai")

//provide own initialiser that creates all new users as "Anonymous" and prints a message
struct User2 {
    var username: String
    
    init() {
        username = "Anonymous"
        print("Creating a new user!")
    }
    
}

var user2 = User2() //initialised to "Anonymous"
user.username = "bai" //change username to "bai"


// 2. Referring to the current instance
struct Person {
    
    var name: String
    
    init(name: String) {
        print("\(name) was born!")
        self.name = name //self. is like this. in Java
        //self.name -> refers to the name property
        //name -> refers to the name parameter
    }
}


// 3. Lazy properties
struct FamilyTree {
    init() {
        print("Creating family tree!")
    }
}

struct Person2 {
    var name: String
    lazy var familyTree = FamilyTree() // lazy keyword -> will only create FamilyTree when it is accessed
    
    init(name: String) {
        self.name = name
    }
}

var ed = Person2(name: "Ed")
ed.familyTree


// 4. Static properties and methods
struct Student {
    static var classSize = 0
    var name: String
    
    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}

let bai = Student(name: "Bai")
print(Student.classSize)


// 5. Access control
struct Person3 {
    private var id: String //private keyword - only methods inside Person3 can read id property
    
    init(id: String) {
        self.id = id
    }
    
    func identify() -> String {
        return "My social security number is \(id)"
    }
    
    
}

let a = Person3(id: "12345")
a.identify()
// a.id won't work 
