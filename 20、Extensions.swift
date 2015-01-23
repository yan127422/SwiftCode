//MARK:1. Computed Properties
extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double{ return self/100.0 }
    var mm: Double{ return self/1000.0 }
    var ft: Double{ return self/3.28084 }
}
let onInch = 25.4.mm
let threeFeet = 3.ft
//MARK:2. Initializers
struct Size {
    var width = 0.0, height = 0.0
}

struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
}

let defaultRect = Rect()
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))
extension Rect {
    init(center: Point, size: Size){
        let originX = center.x - (size.width/2)
        let originY = center.y - (size.height/2)
        self.init(origin: Point(x: originX, y: originY), size:size)
    }
}
let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))
//MARK:3. Methods
extension Int {
    func repetitions(task: ()->()){
        for i in 0..<self {
            task()
        }
    }
}
3.repetitions({
    print("hello ")
})
3.repetitions{
    println("GoodBye! ")
}
//MARK:4. Mutating Instance Methods
extension Int {
    mutating func square(){
        self = self * self
    }
}
var someInt = 3
someInt.square()
//MARK:5. Substripts
extension Int {
    subscript(var digitIndex: Int) -> Int {
        var dicimalBase = 1
        while digitIndex > 0 {
            dicimalBase *= 10
            --digitIndex
        }
        return (self / dicimalBase) % 10
    }
}
4123[0]
4123[1]
4123[2]
//MARK:6. Nested Types
extension Int {
    enum Kind {
        case Negative, Zero, Positive
    }
    var kind: Kind {
        switch self {
        case 0:
            return .Zero
        case let x where x > 0:
            return .Positive
        default:
            return .Negative
        }
    }
}
func printIngegerKinds(numbers: [Int]) {
    for number in numbers {
        switch number.kind {
        case .Negative:
            print("- ")
        case .Zero:
            print("0 ")
        case .Positive:
            print("+ ")
        }
    }
    print("\n")
}
printIngegerKinds([3, 19, -24, 0, -6, 0, 7])


