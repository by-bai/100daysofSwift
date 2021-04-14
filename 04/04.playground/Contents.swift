import UIKit

// 1. for loops
let count = 1...10

for number in count {
    print("Number is \(number)")
}

let names = ["Sterling", "Cyril", "Lana", "Ray", "Pam"]

for _ in names {
    print("[CENSORED] is a secret agent!") // prints 5 times bc 5 items in array
}

print("Players gonna")

for _ in 1...5 {
    print("play") // print "play" 5 times

}


// 2. while loops
var number = 1

while number <= 20 {
    print(number)
    number += 1
}

print("Ready or not, here I come!")



// 3. repeat loops // similar to do while loop in Java
var number2 = 1

repeat {
    print(number2)
    number2 += 1
} while number2 <= 20

print("Ready or not, here I come!")

while false {
    print("This is false") // will never be executed

}

repeat {
    print("This is false") // runs once

} while false

// 4. exiting loops
var countDown = 10

while countDown >= 0 {
    print(countDown)
    
    if countDown == 4 {
        print("I'm bored. Let's go now") // stops when reach 4
        break
    }
    
    countDown -= 1
}

// 5. exiting multiple loops
outerLoop: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print ("\(i) * \(j) is \(product)")

        if product == 50 {
            print("It's a bullseye!")
            break outerLoop
            // for regular break without "outerLoop", only the inner loop would be exited - the outer loop would continue where it left off.
        }
    }
}

// 6. skipping items
for i in 1...10 {
    if i % 2 == 1 {
        continue //skip any numbers that are odd
    }
    
    print(i)
}

// 7. infinite loops
var counter = 0

while true { //true is always true
    print(" ")
    counter += 1
    
    if counter == 273 {
        break //exits loop 
    
    }
}
