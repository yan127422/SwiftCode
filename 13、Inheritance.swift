//TODO:1. Defining a Base Class 
class Vehicle {
    var currentSpeed = 0.0
    var description:String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise(){}
}
let someVehicel = Vehicle()
someVehicel.description
//TODO:2. Subclssing
class Bicycle: Vehicle{
    var hasBasket = false
}
let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0
bicycle.description

class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}
let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
tandem.description
//TODO:3. Overriding
//MARK:1. Accessing Superclass Methods,Properties,and Subscripts
class Train: Vehicle{
    override func makeNoise() {
        println("Choo Choo")
    }
}
let train = Train()
train.makeNoise()
//MARK:2. Overriding Properties(Getters and Setters)
class Car: Vehicle{
    var gear = 1
    override var description:String{
        return super.description + " in gear \(gear)"
    }
}
let car = Car()
car.currentSpeed = 25.0
car.gear = 3
println("Car: \(car.description)")
//MARK:3 Overriding Property Observers
class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet{
            gear = Int(currentSpeed/10.0) + 1
        }
    }
}
let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
println("AutomaticCar: \(automatic.description)")
//TODO:3. Preventing Overrides
//final var, final func, final class func, final subscript, final class

