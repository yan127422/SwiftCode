//TODO:1. Bitwise Operators
//MARK:1. Bitwise NOT Operator
let initialBits:UInt8 = 0b00001111
let invertedBits = ~initialBits
//MARK:2. Bitwise AND Operator
let firstSixBits: UInt8 = 0b11111100
let lastSixBits: UInt8  = 0b00111111
let middleFourBits = firstSixBits & lastSixBits
//MARK:3. Bitwise OR Operator
let someBits: UInt8 = 0b10110010
let moreBits: UInt8 = 0b01011110
let combinedBits = someBits | moreBits
//MARK:4. Bitwise XOR Operator
let firstB: UInt8 = 0b00010100
let lastB:  UInt8 = 0b00000101
let outputBits = firstB ^ lastB
//MARK:5. Bitwise Left and Right Shift Operators
let shiftBits: UInt8 = 4    //00000100
shiftBits << 1              //00001000
shiftBits << 2              //00010000
shiftBits << 5              //10000000
shiftBits << 6              //00000000
shiftBits >> 2              //00000001

let pink: UInt32 = 0xCC6699
let redComponent = (pink & 0xFF0000) >> 16 //0xCC, or 204
let greenComponent = (pink & 0x00FF00) >> 8 //0x66, or 102
let blueComponent = pink & 0x00000FF //0x99, or 153
//MARK:6. Shifting Behavior for Signed Integers
//When you shift signed integers to the right, apply the same rules as for unsigned integers, but fill any empty bits on the left with the sign bit, rather than with a zero.
//TODO:1. Overflow Operators
var potentialOverflow = Int16.max
//potentialOverflow += 1      //this causes an error
//MARK:1. Value Overflow
var willOverflow = UInt8.max
willOverflow = willOverflow &+ 1
//MARK:2. Value Underflow
var willUnderflow = UInt8.min
willOverflow = willUnderflow &- 1

var signedUnderflow = Int8.min          //-128
signedUnderflow = signedUnderflow &- 1  //127
//MARK:3. Division by Zero
//let y = 1/0       //error
let y = 7 &/ 0      //0
//MARK:4. Operator Functions
struct Vector2D {
    var x = 0.0, y = 0.0
}
func + (left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x + right.x, y: left.y + right.y)
}
let vector = Vector2D(x: 3.0, y: 1.0)
let anotherVector = Vector2D(x: 2.0, y: 4.0)
let combinedVector = vector + anotherVector
//MARK:5. Prefix and Postfix Operators
prefix func - (vector: Vector2D) -> Vector2D {
    return Vector2D(x: -vector.x, y: -vector.y)
}
let posittive = Vector2D(x: 3.0, y: 4.0)
let negative = -posittive
let alsoPositive = -negative
//MARK:6. Compound Assignment Operators
func += (inout left: Vector2D, right: Vector2D){
    left = left + right
}
var original = Vector2D(x: 1.0, y: 2.0)
let vectorToAdd = Vector2D(x: 3.0, y: 4.0)
original += vectorToAdd

prefix func ++ (inout vector: Vector2D) -> Vector2D {
    vector += Vector2D(x: 1.0, y: 1.0)
    return vector
}
var toIncrementt = Vector2D(x: 3.0, y: 4.0)
let afterIncrement = ++toIncrementt
toIncrementt
//MARK:7. Equivalence Operators
func == (left: Vector2D, right: Vector2D) -> Bool {
    return (left.x == right.x) && (left.y == right.y)
}
func != (left: Vector2D, right: Vector2D) -> Bool {
    return !(left == right)
}
let twoThree = Vector2D(x: 2.0, y: 3.0)
let anotherTwoThree = Vector2D(x: 2.0, y: 3.0)
if twoThree == anotherTwoThree {
    println("These two vectors are equivalent.")
}
//MARK:8. Custom Operators
prefix operator +++{}
prefix func +++(inout vector: Vector2D) -> Vector2D {
    vector += vector
    return vector
}
var toBeDoubled = Vector2D(x: 1.0, y: 4.0)
let afterDoubling = +++toBeDoubled
toBeDoubled

//MARK:9. Precedence and Associativity for Custom Infix Operators
infix operator +- { associativity left precedence 140 }
func +- (left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x + right.x, y: left.y - right.y)
}
let leftVector = Vector2D(x: 1.0, y: 2.0)
let rightVector = Vector2D(x: 3.0, y: 4.0)
let plusMinusVector = leftVector +- rightVector





