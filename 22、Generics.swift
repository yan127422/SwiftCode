//MARK:1. The Problem That Generics Solve
func swapTwoInts(inout a: Int, inout b: Int){
    let temp = a
    a = b
    b = temp
}
var someInt = 3
var anotherInt = 107
swap(&someInt, &anotherInt)
println("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
func swapTwoString(inout a: String, inout b: String){
    let temp = a
    a = b
    b = temp
}
func swapTwoDouble(inout a: Double, inout b: Double){
    let temp = a
    a = b
    b = temp
}
//MARK:2. Generic Functions
func swapTowValues<T>(inout a: T, inout b: T){
    let temp = a
    a = b
    b = temp
}
swapTowValues(&someInt, &anotherInt)

var someString = "hello"
var anotherString = "world"
swapTowValues(&someString, &anotherString)
println("someString: \(someString), anotherString: \(anotherString)")
swap(&someString, &anotherString)//Swift standard library
println("someString: \(someString), anotherString: \(anotherString)")
//MARK:3. Generic Types
struct IntStack {
    var items = [Int]()
    mutating func push(item: Int){
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
}
struct Stack<T> {
    var items = [T]()
    mutating func push(item: T){
        items.append(item)
    }
    mutating func pop() -> T {
        return items.removeLast()
    }
}
var stackOfStrings = Stack<String>()
stackOfStrings.push("One")
stackOfStrings.push("Two")
stackOfStrings.push("Three")
stackOfStrings.push("Four")
let fromTheTop = stackOfStrings.pop()
//MARK:4. Extending a Generic Type
extension Stack {
    var topItem: T? {
        return items.isEmpty ? nil : items[items.count-1]
    }
}
if let topItem = stackOfStrings.topItem {
    println("The top item on the stack is \(topItem)")
}
//MARK:5. Type Constraints
//Type Constraint Syntax
/*
    func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U){

    }
*/
//MARK:6. Type Constraints in Action
//non-generic function
func findStringIndex(array: [String], valueToFind: String) ->Int?{
    for (index, value) in enumerate(array){
        if value == valueToFind {
            return index
        }
    }
    return nil
}
let strings = ["Cat","Dog","Llama","Parakeet","Terrapin"]
if let foundIndex = findStringIndex(strings, "Llama") {
    println("The index of Llama is \(foundIndex)")
}
//generic version
func findIndex<T: Equatable>(array: [T], valueToFind: T) -> Int? {
    for (index, value) in enumerate(array) {
        if value == valueToFind {
            return index
        }
    }
    return nil
}
let doubleIndex = findIndex([3.14159,0.1,0.25], 9.3)
let stringIndex = findIndex(["Mike","Malcolm","Andrea"], "Andrea")
//MARK:7. Associated Types
protocol Container {
    typealias ItemType
    mutating func append(item: ItemType)
    var count: Int { get }
    subscript(i: Int) -> ItemType { get }
}
//example
struct IntStack2: Container {
    //original IntStack2 implementation
    var items = [Int]()
    mutating func push(item: Int){
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
    //conformance to the Container protocol
    typealias ItemType = Int
    mutating func append(item: ItemType) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}
struct Stack2<T>: Container {
    //original Stack<T> implementation
    var items = [T]()
    mutating func push(item: T){
        items.append(item)
    }
    mutating func pop() -> T {
        return items.removeLast()
    }
    //conformance to the Container protocol
    mutating func append(item: T) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> T {
        return items[i]
    }
}
//MARK:8. Extending an Existing Type to Specify an Associated Type
extension Array: Container{}
//MARK:9. Where Clauses
func allItemsMatch<C1: Container, C2: Container where C1.ItemType == C2.ItemType, C1.ItemType: Equatable>(someContainer: C1, anotherContiner: C2) -> Bool {
    //check that both containers contain the same number of itmes
    if someContainer.count != anotherContiner.count {
        return false
    }
    //chack each pair of items to see if they are equivalent
    for i in 0..<someContainer.count {
        if someContainer[i] != anotherContiner[i] {
            return false
        }
    }
    //all items match, so return true
    return true
}
var stackOfString2 = Stack2<String>()
stackOfString2.push("uno")
stackOfString2.push("dos")
stackOfString2.push("tres")
var arrayOfStrngs = ["uno","dos","tres"]
if allItemsMatch(stackOfString2, arrayOfStrngs) {
    println("All items match.")
}else{
    println("Not all items match.")
}

