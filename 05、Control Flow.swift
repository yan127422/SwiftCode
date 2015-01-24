//TODO: 1. For Loops
//MARK: 1. For-In 
for index in 1...5 {
    println("\(index) times 5 is \(index * 5)")
}
 
let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
answer

let names = ["Anna","Alex","Brian","Jack"]
for name in names {
    println("Hello,\(name)")
}

let numberOfLegs = ["spider":8,"ant":6,"cat":4]
for (animalName,legCount) in numberOfLegs {
    println("\(animalName)s have \(legCount) legs")
}

for c in "Hello" {
    println(c)
}

//MARK: 2. For
for var index = 0;index<3; index++ {
    println("index is \(index)")
}

//TODO: 2. While Loops
//MARK: 1.while(Snakes and Ladders)
let finalSquare = 25
var board = [Int](count: finalSquare+1, repeatedValue: 0)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08

var square = 0
var diceRoll = 0
while square < finalSquare {
    if ++diceRoll == 7 {diceRoll = 1}
    square += diceRoll
    if square < board.count {
        square += board[square]
    }
}
println("Game Over")
//MARK: 2. Do-while
square = 0
do {
    square += board[square];
    if ++diceRoll == 7 {diceRoll = 1}
    square += diceRoll
}while square < finalSquare

//TODO: 3. Conditional Statements
//MARK: 1. If
//TODO: 4. Switch
let someCharacter:Character = "e"
switch someCharacter {
    case "a","e","i","o","u" :
        println("\(someCharacter) is a vowel.")
    case "b","c","d","f","g","h","j","k","l","m","n","p","q"
    ,"r","s","t","v","w","x","y","z" :
        println("\(someCharacter) is a consonant.")
    default:
        println()
}
//MARK: 1. No Implicit Fallthrough
switch "a" {
    //case "a":
case "A":
    println()
default:
    println()
}

//MARK: 2. Range Matching
let count = 2_000_000_000_000
var naturalCount:String
switch count {
case 0:
    naturalCount = "no"
case 1...3:
    naturalCount = "a few"
case 4...9:
    naturalCount = "serveral"
case 10...99:
    naturalCount = "tens of"
case 100...999:
    naturalCount = "hundreds of"
case 1000...999_999:
    naturalCount = "thousands of"
default:
    naturalCount = "millions and millions of"
}
println("There are \(naturalCount) starts in the Milky Way")
//MARK: 3. Tuples
let somePoint = (1,1)
switch somePoint {
case (0,0):
    println("(0,0) is at the origin")
case (_,0):
    println("(\(somePoint.0),0) is on the x-axis.")
case (0,_):
    println("(0,\(somePoint.1)) is one the y-axis")
case (-2...2,-2...2):
    println("(\(somePoint.0),\(somePoint.1)) is inside the box")
default:
    println("(\(somePoint.0),\(somePoint.1)) is outside the box")
}
//MARK: 4. Value Bindings
let anotherPoint = (2,0)
switch anotherPoint {
case (let x,0):
    println("on the x-axis with an x value of \(x)")
case (0,let y):
    println("on the y-axis with a y value of \(y)")
case (let x,let y):
    println("somewhere else at (\(x),\(y))")
}

//MARK: 5. Where
let yetAnotherPoint = (1,-1)
switch yetAnotherPoint {
case let(x,y) where x == y :
    println("(\(x),\(y)) is on the line x==y")
case let(x,y) where x == -y :
    println("(\(x),\(y)) is on the line x==-y")
case let(x,y) :
    println("(\(x),\(y)) is just some arbitrary point")
}

//TODO: 5. Control Transfer Statement
//MARK: 1. Continue
let puzzleInput = "great minds think alike"
var puzzleOutput = ""
for c in puzzleInput {
    switch c {
    case "a","e","i","o","u"," " :
        continue
    default :
        puzzleOutput.append(c)
    }
}
puzzleOutput
//MARK: 2. Break
let numberSymbol:Character = "三"
var possibleIntegerValue:Int?
switch numberSymbol {
case "1","一":
    possibleIntegerValue = 1
case "2","二":
    possibleIntegerValue = 2
case "3","三":
    possibleIntegerValue = 3
case "4","四":
    possibleIntegerValue = 4
default:
    break
}
if let integerValue = possibleIntegerValue {
    println("The integer value of \(numberSymbol) is \(integerValue)")
}else{
    println("An integer value could not be found for \(numberSymbol)")
}
//MARK: 3. Fallthrough
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2,3,5,7,11,13,17,19:
    description += " a prime number ,and also"
    fallthrough
default:
    description += " an integer."
}
description

//MARK: 4. Labeld Statements
square = 0
diceRoll = 0
gameLoop:while square != finalSquare {
    if ++diceRoll == 7 { diceRoll = 1 }
    switch square + diceRoll {
    case finalSquare :
        break gameLoop
    case let newSquare where newSquare > finalSquare:
        continue gameLoop
    default:
        square += diceRoll
        square += board[square]
    }
}
println("Game over")












