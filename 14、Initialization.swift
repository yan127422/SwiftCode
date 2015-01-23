//TODO:1. Setting Initial Values for Stored Properties
//MARK:1. Initializers
struct Fahrenheit {
    var temperature: Double
    init(){
        temperature = 32.0
    }
}
var f = Fahrenheit()
f.temperature
//MARK:2. Default Property Values
struct Fahrenheit2 {
    var temperature = 32.0
}
//TODO:2. Customizing Initialization
//MARK:1. Initializtion Parameters
struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double){
        temperatureInCelsius = (fahrenheit - 32.0)/1.8
    }
    init(fromKelvin kelvin: Double){
        temperatureInCelsius = kelvin - 273.15
    }
}
let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
let freezingPointOfWater = Celsius(fromKelvin: 273.15)
//MARK:2. Local and External Parameter Names
struct Color {
    let red,green,blue: Double
    init(red: Double, green: Double, blue: Double){
        self.red = red
        self.green = green
        self.blue = blue
    }
    init(white: Double){
        red = white
        green = white
        blue = white
    }
}
let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)
//let veryGreen = Color(0.0,1.0,0.0); this reports a compile-time error - external names are required
struct Celsius2 {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double){
        temperatureInCelsius = (fahrenheit - 32.0)/1.8
    }
    init(fromKelvin kelvin: Double){
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsius: Double){
        temperatureInCelsius = celsius
    }
}
let bodyTemperature = Celsius2(37.0)
//MARK:3. Optional Property Types
class SurveyQuestion {
    var text: String
    var response: String?
    init(text: String){
        self.text = text
    }
    func ask(){
        println(text)
    }
}
let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()
cheeseQuestion.response = "Yes, I do like cheese."
//MARK:4. Modifying Constant Properties During Initialization
class SurveyQuestion2 {
    let text: String
    var response: String?
    init(text: String){
        self.text = text
    }
    func ask(){
        println(text)
    }
}
let beetsQuestion = SurveyQuestion2(text: "How about beets?")
beetsQuestion.ask()
beetsQuestion.response = "I also like beets.(But not with cheese.)"
//TODO:3. Default Initializers
class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}
var item = ShoppingListItem()
//MARK:1. Memberwise Initializers for Structure Types
struct Size {
    var width = 0.0, height = 0.0
}
let twoByTwo = Size(width: 2.0, height: 2.0)
//TODO:4. Initializer Delegation for Value Types
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    init(){}
    init(origin: Point,size: Size){
        self.origin = origin
        self.size = size
    }
    init(center: Point, size: Size){
        let originX = center.x - size.width/2
        let originY = center.y - size.height/2
        self.init(origin: Point(x:originX,y: originY),size: size)
    }
}
let basicRect = Rect()
let originRect = Rect(origin: Point(x:2.0,y:2.0), size: Size(width: 5.0, height: 5.0))
let centerRect = Rect(center: Point(x:4.0,y:4.0), size: Size(width: 3.0, height: 3.0))
//TODO:5. Class Inheritance and Initialization
//MARK:1. Designated Initializers and Convenience Initializers
//* Designated initializers must always delegate up.
//* Convenience initializers must always delegate across.
class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheel(s)."
    }
}
let vehicle = Vehicle()
println("Vehicle: \(vehicle.description)")
class Bicycle: Vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}
let bicycle = Bicycle()
println("Bicycle: \(bicycle.description)")
//MARK:2. Automatic Initializer Inheritance
//MARK:3. Designated and Convenience Initializers in Action
class Food {
    var name: String
    init(name: String){
        self.name = name
    }
    convenience init(){
        self.init(name:"[Unnamed]")
    }
}
let namedMeat = Food(name: "Becon")
let mysteryMeat = Food()

class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int){
        self.quantity = quantity //first step
        super.init(name:name)
        
    }
    override convenience init(name: String){
        self.init(name:name,quantity:1)
    }
}
let oneMysteryItem = RecipeIngredient() //auto inherited
let oneBecon = RecipeIngredient(name:"Becon")
let sixEggs = RecipeIngredient(name: "Eggs", quantity:6)

class ShoppingListItem2: RecipeIngredient {
    var purchased = false
    var description: String{
        var output = "\(quantity) x \(name) "
        output += purchased ? "√" : "×"
        return output
    }
}
var breakfastList = [
    ShoppingListItem2(),
    ShoppingListItem2(name: "Bacon"),
    ShoppingListItem2(name:"Eggs", quantity: 6)
]
breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true

for item in breakfastList {
    println(item.description)
}
//TODO:6. Failable Initializers (return nil)
struct Animal {
    let species: String
    init?(species: String){
        if species.isEmpty { return nil }
        self.species = species
    }
}
let someCreature = Animal(species: "Giraffe")
if let giraffe = someCreature {
    println("An animal was initialized with a species of \(giraffe.species)")
}
let anonymousCreature = Animal(species: "")
if anonymousCreature == nil {
    println("The anonymous creature could not be initialized")
}
//MARK:1. Failable Initializers for Enumerations
enum TemperatureUnit {
    case Kelvin, Celsius, Fahrenheit
    init?(symbol: Character){
        switch symbol {
        case "K":
            self = .Kelvin
        case "C":
            self = .Celsius
        case "F":
            self = .Fahrenheit
        default:
            return nil
        }
    }
}
let fahrenheitUnit = TemperatureUnit(symbol: "F")
if fahrenheitUnit != nil {
    println("This is a defined temperature unit, so initialization succeeded.")
}
let unknownUnit = TemperatureUnit(symbol: "X")
if unknownUnit == nil {
    println("This is not a defined temperature unit, so initialization failed.")
}
//MARK:2. Failable Initializers for Classes
class Product {
    let name: String!
    init?(name: String){
        if name.isEmpty { return nil }
        self.name = name
    }
}
if let bowTie = Product(name: "bow tie") {
    println("The product's name is \(bowTie.name)")
}
//MARK:3. Propagation of Initialization Failure
class CartItem: Product {
    let quantity: Int!
    init?(name: String, quantity: Int){
        super.init(name: name)
        if quantity < 1 {return nil}
        self.quantity = quantity
    }
}
if let twoSocks = CartItem(name: "sock", quantity: 2) {
    println("Item: \(twoSocks.name), quantity: \(twoSocks.quantity)")
}

if let zeroShirts = CartItem(name: "shirt", quantity: 0) {
    println("Item: \(zeroShirts.name), quantity: \(zeroShirts.quantity)")
}else{
    println("Unable to initialize zero shirts")
}

if let oneUnnamed = CartItem(name: "", quantity: 1) {
    
}else{
    println("Unable to initialize one unnamed product.")
}
//MARK:4. Overriding a Failable Initializer
class Document {
    var name: String?
    init(){}
    init?(name: String){
        if name.isEmpty { return nil }
        self.name = name
    }
}
class AutomaticallyNamedDocument: Document {
    override init(){
        super.init()
        self.name = "[Untitled]"
    }
    override init(name: String){
//        super.init(name: name) ;A nonfailable initializer can never delegate to a faliable initializer.
        super.init()
        if name.isEmpty {
            self.name = "[Untitled]"
        }else{
            self.name = name
        }
    }
}
//TODO:7. Required Initializers
class SomeClass {
    required init(){}
}
class SomeSubClass: SomeClass {
    required init(){}
}
//TODO:8. Setting a Default Property Value with a Closure of Function
//MARK:1. Example (Checkers)
struct Checkboard {
    let boardColors:[Bool] = {
        var temporaryBoard = [Bool]()
        var isBlack = false
        for i in 1...10 {
            for j in 1...10 {
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return temporaryBoard
    }()
    func squareIsBlackAtRow(row: Int, column: Int) -> Bool {
        return boardColors[row * 10 + column]
    }
}
let board = Checkboard()
board.squareIsBlackAtRow(0, column: 1)
board.squareIsBlackAtRow(9, column: 9)



