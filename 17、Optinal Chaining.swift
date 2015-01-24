//MARK:1. Optional Chaining as an Alternative to Forced Unwrapping 
class Person {
    var residence: Residence?
}
class Residence {
    var numberOfRooms = 1
}
let john = Person()
//let roomCount = john.residence!.numberOfRooms
if let roomCount = john.residence?.numberOfRooms {
    println("John's residence has \(roomCount) room(s).")
}else{
    println("Unable to retrieve the number of rooms.")
}
john.residence = Residence()
if let roomCount = john.residence?.numberOfRooms {
    println("John's residence has \(roomCount) room(s).")
}else{
    println("Unable to retrieve the number of rooms.")
}
//MARK:2. Defining Model Classes for Optional Chaining
class Person2{
    var residence: Residence2?
}
class Residence2 {
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    subscript(i: Int) ->Room {
        get{
            return rooms[i]
        }
        set{
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms(){
        println("The number of room is \(numberOfRooms)")
    }
    var address: Address?
}
class Room {
    let name: String
    init(name: String){
        self.name = name
    }
}
class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if buildingName != nil {
            return buildingName
        } else if buildingNumber != nil {
            return buildingNumber
        }else{
            return nil
        }
    }
}
//MARK:3. Accessing Properties Through Optional Chaining
let roger = Person2()
if let roomCount2 = roger.residence?.numberOfRooms {
    println("Roger's residence has \(roomCount2) room(s).")
}else{
    println("Unable to retrieve the number of rooms.")
}
let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"
roger.residence?.address = someAddress

//MARK:4. Calling Methods Through Optional Chaining
//roger.residence = Residence2()
if roger.residence?.printNumberOfRooms() != nil {
    println("It was possible to print the number of rooms.")
}else{
    println("It was tno possible to print the number of rooms.")
}
//MARK:5. Accessing Subscripts Through Optional Chaining
if let firstRoomName = roger.residence?[0].name {
    println("The first room name is \(firstRoomName).")
}else{
    println("Unable to retrieve the first room name.")
}
roger.residence?[0] = Room(name: "Bathroom")
let rogersHouse = Residence2()
rogersHouse.rooms.append(Room(name: "Living Room"))
rogersHouse.rooms.append(Room(name: "Kitchen"))
roger.residence = rogersHouse
if let firstRoomName = roger.residence?[0].name {
    println("The first room name is \(firstRoomName).")
}else{
    println("Unable to retrieve the first room name.")
}
//Accessing Subscripts of Optional Type
var testScore = ["Dave":[86,83,84],"Bev":[79,94,81]]
testScore["Dave"]?[0] = 91
testScore["Bev"]?[0]++
testScore["Brian"]?[0] = 72
testScore
//MARK:6. Linking Multiple Levels of Chaining
if let rogerStreet = roger.residence?.address?.street {
    println("Roger's street name is \(rogerStreet).")
}else{
    println("Unable to retrieve the address.")
}
let rogerAddress = Address()
rogerAddress.buildingName = "The Larches"
rogerAddress.street = "Laurel Street"
roger.residence!.address = rogerAddress

if let rogerStreet = roger.residence?.address?.street {
    println("Roger's street name is \(rogerStreet).")
}else{
    println("Unable to retrieve the address.")
}
//MARK:7. Chaining on Methods with Optional Return Values
if let buildingIdentifier = roger.residence?.address?.buildingIdentifier() {
    println("Roger's building identifier is \(buildingIdentifier).")
}
if let beginsWithThe =
    roger.residence?.address?.buildingIdentifier()?.hasPrefix("The"){
        if beginsWithThe {
            println("Roger's building identifier begins with \"The\".")
        }else{
            println("Roger's building identifier does not begins with \"The\".")
        }
}







