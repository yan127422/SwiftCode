// Playground - noun: a place where people can play

import Cocoa
//MARK: 1.Assignment Operator
let b = 10
var a:Int? = 3
a = b

let(x,y) = (1,2)

//if x = y {} this is not valid,because x = y does not return a value

//MARK: 2.Arithmetic Operators
1+2
1-2
1*2
1/2

"hello"+"World"
//Remainder
9 % 4
-9 % 4
8 % 2.5 //Floating-Point Remainder Calculations

//Increment and Decrement Operations
var i = 0
++i

//Compound Assignment Operations
var a1 = 1
a1 += 2

//MARK: 3.Comparison Operators
1 == 1
2 != 1
2 > 1
1 < 2
2 <= 1

//MARK: 4.Nil Coalescing Operator
a != nil ? a! : b

let defaultColorName = "Red"
var userDefinedColorName:String? //defaults to nil
var colorNameToUse = userDefinedColorName ?? defaultColorName

userDefinedColorName = "Green"
colorNameToUse = userDefinedColorName ?? defaultColorName

//MARK: 5.Range Operators
//Closed Range Operator
for index in 1...5 {
    println("\(index) times 5 is \(index * 5)")
}
//Half-Open Range Operator
let names = ["Jack Ma","Robin Li","Richard Liu","Roger Yan"]
let count = names.count
for i in 0..<count {
    println("Person \(i+1) is called \(names[i])")
}

//MARK: 6.Logical Operators







