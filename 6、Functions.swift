//MARK:1. Defining and Calling Functions
func sayHello(personName:String)->String {
    let greeting = "Hello, " + personName + "!"
    return greeting
}
println(sayHello("Roger"))

//MARK:2. Function Parameters and Return Values
//a.MUltiple Input Parameters
func halfOpenRangeLength(start:Int, end:Int) -> Int{
    return end-start
}
println(halfOpenRangeLength(1,10))
//b.Functions with Multiple Return Values
func minMax(array:[Int])->(min:Int,max:Int){
    var currentMin = array[0],
        currentMax = array[0]
    for value in array[1..<array.count]{
        if value < currentMin{
            currentMin = value
        }else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin,currentMax)
}

let bounds = minMax([8,-6,3,109,3,71])
println("min is \(bounds.min) and max is \(bounds.max)")
//c.Optional Tuple Return Types
func minMax2(array:[Int])->(min:Int,max:Int)?{
    if array.isEmpty { return nil }
    var currentMin = array[0],
    currentMax = array[0]
    for value in array[1..<array.count]{
        if value < currentMin{
            currentMin = value
        }else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin,currentMax)
}
//optional binding
if let bounds2 = minMax2([8,-6,3,109,3,71]){
    println("min is \(bounds2.min) and max is \(bounds2.max)")
}
//MARK:3. Function Parameter Names
//a.External Parameter Names
func join(s1:String,s2:String,joiner:String) ->String{
    return s1+joiner+s2
}
join("Hello", "World", " ")
func join2(string s1:String, toString s2:String, withJointer joiner:String)->String{
    return s1+joiner+s2;
}
join2(string: "Hello", toString: "World", withJointer: " ")
//b. Shorthand External Parameter Names
func containsCharater(#string:String,#characterToFind:Character)-> Bool {
    for character in string {
        if character == characterToFind{
            return true
        }
    }
    return false
}
let containsV = containsCharater(string: "vectory", characterToFind: "v")
//c.Default Parameter Values
func join3(string s1:String,toString s2:String,withJoiner joiner:String = " ")->String{
    return s1 + joiner + s2
}
join3(string: "Hello", toString: "World", withJoiner: "-")
join3(string: "Hello", toString: "World")
//d.External Names for Parameters with Default Values
func join4(s1:String,s2:String,joiner:String=" ")-> String{
    return s1+joiner+s2
}
join4("Hello", "World", joiner: "*")
//e.Variadic Parameters
func arithmeticMean(numbers: Double...) -> Double {
    var total:Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1,2,3,4,5)
arithmeticMean(3,8.25,18.75)
//f.Constant and Variable Parameter (keyword "var")
func alignRight(var string: String, count: Int, pad: Character) -> String {
    let amountToPad = count - countElements(string)
    if amountToPad < 1 {
        return string
    }
    let padString = String(pad)
    for _ in 1...amountToPad {
        string = padString + string
    }
    return string
}
let originalString = "Hello"
let paddedString = alignRight(originalString, 10, "-")
//g.In-Out Parameters
func swapTowInts(inout a: Int, inout b: Int){
    let temp = a
    a  = b
    b = temp
}
var someInt = 3
var anotherInt = 106
swap(&someInt, &anotherInt)
someInt
anotherInt
//MARK:4. Function Types
//a.Using Function Types
func addTowInts(a: Int,b: Int) -> Int {
    return a+b
}
func multiplyTowInts(a: Int, b: Int) -> Int {
    return a*b
}
var mathFunction: (Int,Int) -> Int = addTowInts
println("Result:\(mathFunction(2,3))")
mathFunction = multiplyTowInts
println("Result:\(mathFunction(2,3))")
//b.Function Types as Parameter Types
func printMathResult(mathFunction:(Int,Int)->Int, a: Int, b:Int){
    println("result:\(mathFunction(a,b))")
}
printMathResult(addTowInts, 10, 5)
//c.Function Types as Return Types
func stepForward(input:Int)->Int{//function type (Int) -> Int
    return input + 1
}
func stepBackward(input:Int)->Int{
    return input - 1
}
func chooseStepFunction(backwards:Bool)->(Int)->Int{
    return backwards ? stepBackward : stepForward
}
var currentValue = 3
let moveNearerToZero = chooseStepFunction(currentValue>0)
println("Counting to Zero:")
while currentValue != 0 {
    println("\(currentValue)...")
    currentValue = moveNearerToZero(currentValue)
}
println("zero!")
//MARK:5. Nested Functions
func chooseSetpFunction2(backward:Bool)->(Int)->Int{
    func stepForward(input:Int)->Int{return input+1}
    func stepBackward(input:Int)->Int{return input-1}
    return backward ? stepBackward : stepForward
}
var currentValue2 = -4
let moveNearerToZero2 = chooseSetpFunction2(currentValue2>0)
while currentValue2 != 0 {
    println("\(currentValue2)")
    currentValue2 = moveNearerToZero2(currentValue2)
}
println("zero!")