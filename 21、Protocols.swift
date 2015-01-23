//MARK:1.Protocol Syntax
/*
    protocol SomeProtocol{

    }
    class SomeClass: SomeSuperClass, FirstProtocol, AnotherProtocol{

    }
*/

//MARK:2. Property Requirements
protocol FullyNamed {
    var fullName: String { get }
}
struct Person: FullyNamed {
    var fullName: String
}
let john = Person(fullName: "John Appleseed")

class Starship: FullyNamed {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil){
        self.name = name
        self.prefix = prefix
    }
    var fullName: String {
        return (prefix != nil ? prefix! + " ":"") + name
    }
}
var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
ncc1701.fullName
//MARK:3. Method Requirements
protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29574.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c ) % m)
        return lastRandom / m
    }
}
let generator = LinearCongruentialGenerator()
generator.random()
generator.random()
generator.random()
//MARK:4. Mutating Method Requirements
protocol Togglable {
    mutating func toggle()
}
enum OnOffSwitch: Togglable{
    case Off, On
    mutating func toggle() {
        switch self {
        case Off:
            self = On
        case On:
            self = Off
        }
    }
}
var lightSwitch = OnOffSwitch.Off
lightSwitch.toggle()
//MARK:5. Initializer Requirements
protocol SomeProtocol {
    init()
}
class SomeSuperClass {
    init(){}
}
class SomeSubClass: SomeSuperClass, SomeProtocol {
    //"required" from SomeProtocol conformance; "override" from SomeSuperClass
    required override init(){
        
    }
}
//MARK:6. Protocol as Types
class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator){
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}
var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
for _ in 1...5 {
    println("Random dice roll is \(d6.roll())")
}
//MARK:7. Delegation(Game)
protocol DiceGame {
    var dice: Dice { get }
    func play()
}
protocol DiceGameDelegate {
    func gameDidStart(game: DiceGame)
    func game(game: DiceGame, didstartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(game: DiceGame)
}
class SnakesAndLadders: DiceGame {
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board: [Int]
    init(){
        board = [Int](count: finalSquare + 1, repeatedValue: 0)
        board[03] = +8; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    var delegate: DiceGameDelegate?
    func play() {
        square = 0
        delegate?.gameDidStart(self)
        gameLoop: while square != finalSquare {
            let diceRoll = dice.roll()
            delegate?.game(self, didstartNewTurnWithDiceRoll: diceRoll)
            switch square + diceRoll {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
        }
        delegate?.gameDidEnd(self)
    }
}
class DiceGameTracker: DiceGameDelegate {
    var numberOfTurns = 0
    func gameDidStart(game: DiceGame) {
        numberOfTurns = 0
        if game is SnakesAndLadders {
            println("Started a new game of Snakes and Ladders")
        }
        println("The game is using a \(game.dice.sides)-sided dice")
    }
    func game(game: DiceGame, didstartNewTurnWithDiceRoll diceRoll: Int) {
        ++numberOfTurns
        println("Rolled a \(diceRoll)")
    }
    func gameDidEnd(game: DiceGame) {
        println("The game lasted for \(numberOfTurns) turns")
    }
}
let tracker = DiceGameTracker()
let game = SnakesAndLadders()
game.delegate = tracker
game.play()
//MARK:8. Adding Protocol Conformance With an Extension
protocol TextRepresentable {
    func asText() -> String
}
extension Dice: TextRepresentable {
    func asText() -> String {
        return "A \(sides)-sides dice"
    }
}
let d12 = Dice(sides: 12, generator: LinearCongruentialGenerator())
d12.asText()

extension SnakesAndLadders: TextRepresentable{
    func asText() -> String {
        return "A game of Snakes and Ladders with \(finalSquare) squares"
    }
}
game.asText()
//MARK:9. Declaring Protocol Adopting with an Extension
struct Hamster {
    var name: String
    func asText() -> String {
        return "A hamster named \(name)"
    }
}
extension Hamster: TextRepresentable{}
let simonTheHamster = Hamster(name: "Simon")
let somethingTextRepresentable: TextRepresentable = simonTheHamster
somethingTextRepresentable.asText()
//MARK:10. Collections of Protocol Types
let things: [TextRepresentable] = [game,d12,simonTheHamster]
for thing in things {
    println(thing.asText())
}
//MARK:11. Protocol Inheritance
protocol PrettyTextRepresentable: TextRepresentable {
    func asPrettyText() -> String
}
extension SnakesAndLadders: PrettyTextRepresentable{
    func asPrettyText() -> String {
        var output = asText() + ":\n"
        for index in 1...finalSquare {
            switch board[index]{
            case let ladder where ladder > 0:
                output += "⬆️"
            case let snake where snake < 0:
                output += "⬇️"
            default:
                output += "0⃣️"
            }
        }
        return output
    }
}
println(game.asPrettyText())
//MARK:12. Class-Only Protocols
protocol SomeClassOnlyProtocol: class, TextRepresentable{
    //class-only protocol definition goes here
}
//MARK:13. Protocol Composition
protocol Named {
    var name: String{ get }
}
protocol Aged {
    var age: Int { get }
}
struct Person2: Named, Aged {
    var name: String
    var age: Int
}
func wishHappyBirthdy(celebrator: protocol<Named, Aged>){
    println("Happy birthday \(celebrator.name)- you're \(celebrator.age)!")
}
let birthdayPerson = Person2(name: "Malcolm", age: 21)
wishHappyBirthdy(birthdayPerson)
//MARK:14. Checking for Protocol Conformance
@objc protocol HasArea {
    var area: Double{ get }
}
class Circle: HasArea {
    let pi = 3.1415927
    var radius: Double
    var area: Double{ return pi * radius * radius }
    init(radius: Double){ self.radius = radius }
}
class Country: HasArea {
    var area: Double
    init(area: Double){ self.area = area }
}
class Animal {
    var legs: Int
    init(legs: Int){ self.legs = legs }
}
let objs:[AnyObject] = [
    Circle(radius: 2.0),
    Country(area: 234_610),
    Animal(legs: 4)
]
for obj in objs {
    if let objectWithArea = obj as? HasArea{
        println("Area is \(objectWithArea.area)")
    }else{
        println("Something that doesn't have an area")
    }
}

//MARK:15. Optional Protocol Requirements
@objc protocol CounterDataSource {
    optional func incrementForCount(count: Int) -> Int
    optional var fixedIncrement: Int { get }
}
@objc class Counter {
    var count = 0
    var dataSource: CounterDataSource?
    func increment(){
        if let amount = dataSource?.incrementForCount?(count){
            count += amount
        }else if let amount = dataSource?.fixedIncrement? {
            count += amount
        }
    }
}
class ThreeSource: CounterDataSource {
    let fixedIncement = 3
}
var counter = Counter()
counter.dataSource = ThreeSource()
for _ in 1...4 {
    counter.increment()
    println(counter.count)
}

class TowardsZeroSource: CounterDataSource {
    func incrementForCount(count: Int) -> Int {
        if count == 0 {
            return 0
        }else if count < 0 {
            return 1
        }else {
            return -1
        }
    }
}
counter.count = -4
counter.dataSource = TowardsZeroSource()

for _ in 1...5 {
    counter.increment()
    println("TowardsZero:\(counter.count)")
}