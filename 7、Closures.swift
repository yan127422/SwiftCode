//TODO:一、Closure Expressions
//MARK:1. The Sorted Function
let names = ["Charis", "Alex", "Ewa", "Barry", "Daniella"]
func backwards(s1:String, s2:String) -> Bool {
    return s1 > s2
}
var reversed = sorted(names,backwards)
//MARK:2. Closure Expression Syntax
/*
    {( parameters ) -> return type in
        statements
    }
*/
reversed = sorted(names,{(s1:String, s2:String)->Bool in
    return s1 > s2
})
//MARK:3. Inferring Type From Context
reversed = sorted(names,{s1,s2 in return s1 > s2 })
//MARK:4. Implict Returns from Single-Expression Closures
reversed = sorted(names,{s1,s2 in s1 > s2 })
//MARK:5. Shorthand Argument Names
reversed = sorted(names,{ $0 > $1 })
//MARK:6. Operator Functions
reversed = sorted(names, >)

//TODO:二、Trailing Closure
reversed = sorted(names){ $0 > $1 }
let digitNames = [
    0:"Zero", 1:"One", 2:"Two", 3:"Three", 4:"Four",
    5:"Five", 6:"Six", 7:"Seven", 8:"Eight", 9:"Nine"
]
let numbers = [16,58,510]
let string = numbers.map {
    (var number) -> String in
    var output = ""
    while number > 0 {
        output = digitNames[number % 10]! + output
        number /= 10
    }
    return output
}
//TODO:三、Capturing Values
func makeIncrementor(forIncrement amount: Int) ->()->Int {
    var runningTotal = 0
    func incrementor() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementor
}
let incrementByTen = makeIncrementor(forIncrement: 10)
incrementByTen()
incrementByTen()
let incrementBySeven = makeIncrementor(forIncrement: 7)
incrementBySeven()

incrementByTen()
//TODO:四、Closures Are Reference Types
let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()


