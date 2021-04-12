import UIKit

// 1. Arithmetic operators
let firstScore = 12
let secondScore = 4

let total = firstScore + secondScore
let difference = firstScore - secondScore

let product = firstScore * secondScore
let divided = firstScore / secondScore
let remainder = 13 % secondScore


// 2. Operator overloading
let meaningOfLife = 42
let doubleMeaning = 42 + 42

let fakers = "Fakers gonna "
let action = fakers + "fake"

let firstHalf = ["John", "Paul"]
let secondHalf = ["George", "Ringo"]
let beatles = firstHalf + secondHalf


// 3. Compound assignment operators
var score = 95
score -= 5

var quote = "The rain in Spain falls mainly on the "
quote += "Spaniards"


// 4. Comparison operators
let score1 = 6
let score2 = 4

score1 == score2
score1 != score2

score1 < score2
score1 >= score2

"Taylor" <= "Swift"


// 5. Conditions
let firstCard = 11
let secondCard = 10

if firstCard + secondCard == 2 {
    print("Aces A lucky!")
}
else if firstCard + secondCard == 21 {
    print("Blackjack!")
} else {
    print("Regular cards")
}


// 6. Combining Conditions
let age1 = 12
let age2 = 21

if age1 > 18 && age2 > 18 {
    print("Both are over 18")

}

if age1 > 18 || age2 > 18 {
    print("One of them is over 18")
}


// 7. Ternary operator
let card1 = 11
let card2 = 10
print(card1 == card2 ? "Cards are the same" : "Cards are different")

if card1 == card2 {
    print("Cards are the same")
} else {
    print("Cards are different")
}


// 8. Switch statements
let weather = "sunny"

switch weather {
case "rain":
    print("Bring an umbrella")
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear sunscreen")
    fallthrough // swift will only run the code inside each case, for execution to continue on to the next case use the fallthrough keyword
default:
    print("Enjoy your day!") //if the weather is anything other than rain, snow, or sun
}


// 9. Range operators
let scoreRange = 85

switch scoreRange {
case 0..<50:
    print("You failed badly.")
case 50..<85:
    print("You did OK.")
default:
    print("You did great!")
}
