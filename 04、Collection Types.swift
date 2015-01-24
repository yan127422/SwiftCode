//TODO: 1、Array
//MARK: 1. Array Literals
var shoppingList1:[String] = ["Eggs","Milk"]
var shoppingList2 = ["Eggs","Milk"]
 
//MARK: 2. Accessing and Modifying an Array
println("The shoppingList1 countains \(shoppingList1.count) items.")
if shoppingList1.isEmpty  {
    println("The shoppingList is empty.")
}else{
    println("The shoppingList is not empty")
}
//add
shoppingList1.append("Flour")
shoppingList1 += ["Baking Powder"]
shoppingList1 += ["Chocolate Spread","Chese","Butter"]

//get
var firstItem = shoppingList1[0]

//set
shoppingList1[0] = "Six eggs"
shoppingList1
shoppingList1[4...6] = ["Bananas","Apples"]
shoppingList1

//insert
shoppingList1.insert("Maple Syrup", atIndex: 0)
//remove
let mapleSyrup = shoppingList1.removeAtIndex(0)
firstItem = shoppingList1[0]
let apples = shoppingList1.removeLast()

//MARK: 3. Iterating Over an Array
for item in shoppingList1 {
    println(item)
}

for (index,value) in enumerate(shoppingList1) {
    println("Item \(index+1) : \(value)")
}

//MARK: 4. Creating and Initializing an Array
var someInts = [Int]()
someInts.append(3)
someInts = []

var threeDoubles = [Double](count: 3, repeatedValue: 0.0)
var anotherThreeDoubles = [Double](count: 3, repeatedValue: 2.5)

var sixDoubles = threeDoubles + anotherThreeDoubles
//TODO: 2.Dictionaries
//MARK: 1. Dictionary Literals
var airports:[String:String] = ["YYZ":"Toronto Pearson","DUB":"Dublin"]
var airports2 = ["YYZ":"Toronto Pearson","DUB":"Dublin"]
//MARK: 2. Accessing and Modifying Dictionary
println("The airports dictionary contains \(airports.count) items")

if airports.isEmpty {
    println("The airports dictionary is empty.")
}else{
    println("The airports dictionary is not empty.")
}
//add
airports["LHR"] = "London"
airports
airports["LHR"] = "London Heathrow"
airports

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB"){
    println("The old value for DUB was \(oldValue).")
}

if let airportName = airports["DUB"] {
    println("The name of the airport is \(airportName).")
}else{
    println("That airport is not in the airports dictionary")
}
//add and remove
airports["APL"] = "Apple International"
airports
airports["APL"] = nil
airports
//MARK: 3. Interating Over a Dictionary
for (airportCode,airportName) in airports {
    println("\(airportCode): \(airportName)")
}

for airportCode in airports.keys {
    println("Airport code: \(airportCode)")
}

for airportName in airports.values {
    println("Airport Name: \(airportName)")
}

let airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)
//MARK: 4. Creating an Empty Dictionary
var namesOfIntegers = [Int:String]()

namesOfIntegers[16] = "sixteen"
namesOfIntegers = [:]



