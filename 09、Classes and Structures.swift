//TODO:1.Comparing Classes and Strucures
//MARK:1. Definition Syntax
struct Resolution{
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name:String?
}
//MARK:2. Class and Structure Instances
let someResolution = Resolution()
let someVideoMode = VideoMode()
//MARK:3. Accessng Properties
println("The width of someResolution is \(someResolution.width)")
println("The width of someVideoMode is \(someVideoMode.resolution.width)")
someVideoMode.resolution.width = 1280
println("The width of someVideoMode is now \(someVideoMode.resolution.width)")
//MARK:4. Memberwise Initializers for Structure Types
let vga = Resolution(width: 640, height: 320)
//TODO:2. Structures and Enumerations Are Value Types
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048
cinema.width
hd.width
enum CompassPoint {
    case North, South, East, West
}
var currentDirection = CompassPoint.West
let rememberedDirection = currentDirection
currentDirection = .East
if rememberedDirection == .West {
    println("The rememberedDirection is still .West")
}
//TODO:3. Classes Are Reference Types
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30
tenEighty.frameRate
//MARK:1. Indentity Operators
tenEighty === alsoTenEighty
//MARK:2. Pointers
