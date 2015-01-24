//MARK:1. Access Control Syntax
public class SomePublicClass{}
internal class SomeInternalClass{}
private class SomePrivateClass{}

public var somePublicVariable = 0
internal let someInternalConstant = 0
private func somePrivateFunction(){}

class SomeInternalClass2 {}  //implicitly internal
var someInternalConstant2 = 0 //implicitly internal
//MARK:2. Custom Types
public class SomePublicClass2{      //explicitly public
    public var somePublicProperty = 0       //explicitly public class member
    var someInterProperty = 0               //implicitly internal class member
    private func somePrivateMethod(){}      //explicitly private class member
}
class SomeInternal {    //implicitly internal
    var someInternalProperty = 0    //implicitly internal class member
    private func somePrivateMethod(){}
}
private class SomePrivateClass2 {   // explicitly private
    var somePrivateProperty = 0     //implicitly private class member
    func somePrivateMethod() {}     //implicitly private class member
}
//MARK:3.TupleTypes
//MARK:4. Function Types
//func someFunction() -> (SomeInternalClass, SomePrivateClass) {}//error,Function must be declared private
private func someFunctinn() -> (SomeInternalClass, SomePrivateClass) {
    return (SomeInternalClass(),SomePrivateClass())
}
//MARK:5. Enumeration Types
public enum CompassPoint {
    case North
    case South
    case East
    case West
}
//MARK:6. Subclassing
public class A {
    private func someMethod(){}
}
internal class B: A {
    override internal func someMethod() {
        super.someMethod()
    }
}
//MARK:7.Getters and Setters
struct TrackedString {
    private(set) var numberOfEdits = 0
    var value: String = "" {
        didSet {
            numberOfEdits++
        }
    }
}
var stringToEdit = TrackedString()
stringToEdit.value = "This string will be tracked."
stringToEdit.value += " This edit will increment numberOfEdits."
stringToEdit.value += " So will this one."
stringToEdit.numberOfEdits // you can not modify the property from another source file
public struct TrackedString2 {
    public private(set) var numberOfEdits = 0
    public var value: String = "" {
        didSet {
            numberOfEdits++
        }
    }
    public init(){}
}


