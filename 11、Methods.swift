//TODO:1. Instnce Methods
class Counter {
    var count = 0
    func increment(){
        count++
    }
    func incrementBy(amount: Int){
        count += amount
    }
    func reset(){
        count = 0
    }
}
let counter = Counter()
counter.increment()
counter.incrementBy(5)
counter.reset()
//MARK:1. Local and External Parameter Names for Methods
class Counter2 {
    var count: Int = 0
    func incrementBy(amount: Int, numberOfTimes: Int){
        count += amount * numberOfTimes
    }
}
let counter2 = Counter2()
counter2.incrementBy(5, numberOfTimes: 3)
//MARK:2. Modifying External Parameter Name Behavior for Methods
class Counter3 {
    var count: Int = 0
    func incrementBy(#amount: Int, _ numberOfTimes: Int){//#,_
        count += amount * numberOfTimes
    }
}
let counter3 = Counter3()
counter3.incrementBy(amount: 5, 3)
//MARK:3. The self Property
struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOfX(x: Double) -> Bool {
        return self.x > x
    }
}
let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOfX(1.0) {
    println("The point is to the right of the line where x==1.0")
}
//MARK:4. Modifying Value Types from Within Instance Methods
//Structures and enumerations are value types. By default, the properties of a value type cannot be modified from within its instance methods
struct Point2 {
    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX: Double,y deltaY: Double){
        x += deltaX
        y += deltaY
    }
}
var somePoint2 = Point2(x: 1.0, y: 1.0)
somePoint2.moveByX(2.0, y: 3.0)
let fixedPoint = somePoint2
//fixedPoint.moveByX(2.0, y: 3.0); this will report an error
//MARK:5. Assigning to self Within a Mutating Method
struct Point3 {
    var x = 0.0, y = 0.0
    mutating func moveBy(deltaX: Double, y deltaY: Double){
        self = Point3(x: x+deltaX, y: deltaY)
    }
}

enum TriStateSwitch {
    case Off, Low, High
    mutating func next(){
        switch self {
        case Off:
            self = Low
        case Low:
            self = High
        case High:
            self = Off
        }
    }
}
var ovenLight = TriStateSwitch.Low
ovenLight.next()
ovenLight.next()
//TODO:2. Type Methods (Example)
struct LevelTracker {
    static var highestUnlockedLevel = 1
    static func unlockLevel(level: Int) {
        if level > highestUnlockedLevel { highestUnlockedLevel = level }
    }
    static func levelIsUnlocked(level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    var currentLevel = 1
    mutating func advanceToLevel(level: Int) -> Bool {
        if LevelTracker.levelIsUnlocked(level){
            currentLevel = level
            return true
        }else{
            return false
        }
    }
}
class Player {
    var tracker = LevelTracker()
    let playName:String
    func completedLevel(level: Int){
        LevelTracker.unlockLevel(level)
        tracker.advanceToLevel(level)
    }
    init(name: String){
        playName = name
    }
}
var player = Player(name: "Roger")
player.completedLevel(1)
//player.completedLevel(6)
LevelTracker.highestUnlockedLevel
player = Player(name: "Beto")
if player.tracker.advanceToLevel(6) {
    println("player is now no level 6")
}else{
    println("level 6 has not yet been unlocked")
}




