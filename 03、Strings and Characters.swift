//MARK: 1. String Literals
let someString = "some string literal value"

//MARK: 2. Initializing an Empty String
var emptyString = ""
var anotherEmptyString = String()
if emptyString.isEmpty {
    println("Nothing to see here")
}

//MARK: 3. String Mutability
var variableString = "Horse"
variableString += " and carriage"

let constantString = "Highlander"
//constantString += " and another Highlander"

//MARK: 4. String Are Value Types

//MARK: 5. Woring with Characters
for character in "Dog 🐶" {
    println(character)
}

let yenSign:Character = "￥"

//MARK: 6. Concatenating String and Characters
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2

var instruction = "look over"
instruction += string2

let exclamationMark:Character = "!"
welcome.append(exclamationMark)

//MARK: 7. String Interpolation
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier)*2.5)"

//MARK: 8. Unicode
//Special Unicode Characters in String Literals
let wiseWord = "\"Imagination is more important than knowledge\" -Einstein"
let dollarSign = "\u{24}"
let blackHeart = "\u{2665}"
let sparklingHeart = "\u{1f496}"
//Extended Grapheme
let eAcute:Character = "\u{e9}"
let combinedEAcute:Character = "\u{65}\u{301}"

//MARK: 9. Counting Characters
let unusualMenagerie = "Koala 🐨, Snail 🐌, Pengiun 🐧, Dromedary 🐫"
println("unusualMenagerie has \(countElements(unusualMenagerie)) characters")
var word = "cafe"
println("the number of characters in \(word) is \(countElements(word))")

word += "\u{301}"
println("the number of characters in \(word) is \(countElements(word))")

//MARK: 10. Comparing Strings
let quotation = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation == sameQuotation {
    println("These tow strings are considered equal")
}

//MARK: 11. Prefix and Suffix Equality
let romeoAndJuliet = [
    "Act 1 Scene 1: Verona,A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]
var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 "){
        act1SceneCount++
    }
}
println("There are \(act1SceneCount) scenes in Act 1")

var mansionCount = 0,
    cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion"){
        mansionCount++
    }else if scene.hasSuffix("Friar Lawrence's cell"){
        cellCount++
    }
}
println("\(mansionCount) mansion scenes;\(cellCount) cell scenes")

//MARK: 12. Unicode Representations of Strings
let dogString = "Dog!!🐶"
var utf8Str = ""
for codeUnit in dogString.utf8 {
    utf8Str += "\(codeUnit) "
}
println(utf8Str)

var utf16Str = ""
for codeUnit in dogString.utf16 {
    utf16Str += "\(codeUnit) "
}
println(utf16Str)



