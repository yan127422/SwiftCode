//MARK:1. Enumeration Syntax
enum CompassPoint {
    case North
    case South
    case East
    case West
}
 
enum Planet {
    case Mercury, Venus, Earth, Mars, Jupiter, Statun, Uranus, Neptune
}

var directionToHead = CompassPoint.West
directionToHead = .East
//MARK:2. Matching Enumeration Values with a Switch Statement
switch directionToHead {
case .North:
    println("Lots of planets have a north")
case .South:
    println("Watch out for pengius")
case .East:
    println("Where the sun rises")
case .West:
    println("Where the skies are blue")
}

let somePlanet = Planet.Earth
switch somePlanet {
case .Earth:
    println("Mostly harmless")
default:
    println("Not a safe place for humans")
}
//MARK:3. Associated Values
enum Barcode {
    case UPCA(Int,Int,Int,Int)
    case QRCode(String)
}
var productBracode = Barcode.UPCA(8, 85909, 51226, 3)
productBracode = Barcode.QRCode("ABCDEFGHIJKLMNOP")
switch productBracode {
case .UPCA(let numberSystem,let manufacturer,let product,let check):
    println("UPC-A: \(numberSystem), \(manufacturer), \(product) \(check)")
case .QRCode(let productCode):
    println("QRCode: \(productCode)")
}
//MARK:4. Raw Values
enum ASCIIControllCharacter : Character{
    case Tab = "\t"
    case LineFeed = "\n"
    case CarriageReturn = "\r"
}

enum Planet2: Int {//auto-incrementation
    case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}
let earthsOrder = Planet2.Earth.rawValue
let possiblePlanet = Planet2(rawValue: 7)
let positionToFind = 9
//optional binding
if let somePlanet = Planet2(rawValue: positionToFind) {
    switch somePlanet {
    case .Earth:
        println("Mostly harmless")
    default:
        println("Not a safe place for humans")
    }
}else{
    println("There isn't a planet at position \(positionToFind)")
}
