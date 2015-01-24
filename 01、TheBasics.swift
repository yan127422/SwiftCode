var str = "Hello, playground"
//MARK: 1、Constants and Variables
let maximumNumberofLoginAttempts = 10
var currentLoginAttempt = 0

var x = 0.0, y = 1.0, z = 2.0

//MARK: 2、Type Annotations
var welcomeMessage:String
welcomeMessage = "Hello"

var red,green,blue:Double

//MARK: 3、Naming Constants and Variables
let π = 3.141592
let 你好 = "你好"
let 🐴到成功 = "马到成功"

//MARK: 4、Printing Constants and Variables
println(🐴到成功)
println("祝你 \(🐴到成功)")

//MARK: 5、Comments
//this is a comment
/* this is also a comment,
    but written over multiple lines
*/

//MARK: 6、Semicolons
let cat = "🐱"; println(cat)

//MARK: 7、Integers
let minValue = UInt8.min
let maxValue = UInt8.max

//MARK: 8、Type Safety and Type Inference
let meaningOfLife = 42 //meaningOfLife is inferred to be of type Int

let pi = 3.14159 //pi is inferred to be of type Double

let anotherPi = 3 + 0.14159 // anotherPi is also inferred to be of type Double

//MARK: 9、Numeric Literals
let decimalInteger = 17
let binaryInteger = 0b1001
let octalInteger = 0o21
let hexadecimallInteger = 0x11

//MARK: 10、Number type Conversion
//Integer Conversion
//let cannotBeNegative:UInt8 = -1
//UInt8 cannot store negative numbers,and so this will report an error
//let tooBig:Int8 = Int8.max + 1
//UInt8 cannot store a number larger than its maximum value,and this will also report an error

let twoThousand:UInt16 = 2_000
let one:UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)

//Integer and Floating-Point Conversion
let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi2 = Double(three) + pointOneFourOneFiveNine

let integerPi = Int(pi)

//MARK: 11、Type Aliases
typealias AudioSample = UInt16
var minAmplitudeFound = AudioSample.min

//MARK: 12、Booleans
let orangesAreOrange = true
let turnipsAreDelicious = false

if turnipsAreDelicious {
    println("Mmm")
}else{
    println("Eww,turinps are horrible-.")
}

//MARK: 13、Tuples
let http404Error = (404,"Not found")

let (statusCode,statusMessage) = http404Error
println("The status code is \(statusCode)")
println("The status Message is \(statusMessage)")

let (justTheStatusCode,_) = http404Error
println("The status code is \(justTheStatusCode)")

println("status code:\(http404Error.0)")
println("status Message:\(http404Error.1)")

let http200Status = (statusCode:200,description:"ok")
println("status code:\(http200Status.statusCode),\(http200Status.0)")
println("status description:\(http200Status.description),\(http200Status.1)")

//MARK: 14、Optionals
let possibleNumber = "123"
let convertedNumber = possibleNumber.toInt() //convertedNumber is inferred to be of type "Int?",or "optional Int"
//nil
var serverResponseCode:Int? = 404
serverResponseCode = nil //serverResponseCode now contains no value

var surveyAnswer:String? //surveyAnswer is automatically set to nil

//If Statements and Forced Unwarpping
if convertedNumber != nil {
    println("convertedNumber has an integer value of \(convertedNumber)!")
}

//Optional Binding
if let actualNumber = possibleNumber.toInt() {
    println("\'\(possibleNumber)\'has an integer value of \(possibleNumber)")
}else{
    println("\'\(possibleNumber)\'could not be convertexd to an integer")
}

//Implicitly Unwarpped Optionals
let possibleString:String? = "An optional string."
let forcedString:String = possibleString! //require

let assumedString:String! = "An implicitly unwarpped optional string."
let implicitString:String = assumedString //no need for an exclamation mark

if let definiteString = assumedString {
    println(definiteString);
}

//MARK: 15、Assertions
let age = -3
assert(age >= 0, "A person's age cannot be less than zero")







