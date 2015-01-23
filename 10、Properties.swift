//TODO:1. Stored Properties
struct FixedLengthRange {
    var firstValue:Int
    let length:Int
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6
let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
//rangeOfFourItems.firstValue = 1 ;an instance of structure is a value type
//MARK:1. Lazy Stored Properties
class DataImporter {
    var fileName = "data.txt"
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}
let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
manager
manager.importer.fileName
manager
//MARK:2. Stored Properties and Instance Variables
//TODO:2. Computed Properties
struct Point {
    var x = 0.0,
        y = 0.0
}
struct Size {
    var width = 0.0,
        height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width/2)
            let centery = origin.y + (size.height/2)
            return Point(x: centerX, y: centery)
        }
        set(newCenter){
            origin.x = newCenter.x - (size.width/2)
            origin.y = newCenter.y - (size.height/2)
        }
    }
}
var square = Rect(origin: Point(x:0.0,y:0.0), size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x:15,y:15)
//MARK:1. Shorthand Setter Declaration
struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get{
            return Point(x: origin.x+size.width/2, y: origin.y+size.height/2)
        }
        set{//default name "newValue"
            origin.x = newValue.x - size.width/2
            origin.y = newValue.y - size.height/2
        }
    }
}
//MARK:2. Read-Onlu Computed Properties
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
fourByFiveByTwo.volume
//TODO:3. Property Observers
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps){
            println("About to set totalSteps to \(newTotalSteps)")
        }
        didSet{
            if totalSteps > oldValue {
                println("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
stepCounter.totalSteps = 896
//TODO:4. Global and Local Variables
var globalVariable: Int = 0 {
willSet{
    println("willSet globalVariable:\(newValue)")
}
didSet{
    println("didSet globalVariable:\(globalVariable)")
}
}
globalVariable = 1
//TODO:5. Type Properties
//MARK:1. Type Property Syntax
struct SomeStructure {
    static var storedTypeProperty = "Some Value."
    static var computedTypeProperty: Int {
        return 1
    }
}
enum SomeEnumeration {
    static var storedTypeProperty = "Some Value."
    static var computedTypeProperty: String {
        return "-->\(storedTypeProperty)"
    }
}
class SomeClass {
    class var computedTypeProperty: Int {
        return 1
    }
}
//MARK:2. Querying and Setting Type Properties
println(SomeClass.computedTypeProperty)
SomeStructure.storedTypeProperty
SomeStructure.storedTypeProperty = "Another Value"
SomeStructure.storedTypeProperty
//MARK:3. Example
struct AudioChannel {
    static let threshouldLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel:Int = 0 {
        didSet {
            if currentLevel > AudioChannel.threshouldLevel {
                currentLevel = AudioChannel.threshouldLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}
var leftChannel = AudioChannel(),
    rightChannel = AudioChannel()
leftChannel.currentLevel = 7
leftChannel.currentLevel
AudioChannel.maxInputLevelForAllChannels

rightChannel.currentLevel = 11
rightChannel.currentLevel
AudioChannel.maxInputLevelForAllChannels




