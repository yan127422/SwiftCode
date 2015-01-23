//
//  main.swift
//  16、Automatic Reference Counting
//
//  Created by lsscl on 15-1-20.
//  Copyright (c) 2015年 roger. All rights reserved.
//

import Foundation
//MARK:1. ARC in Action
class Person {
    let name: String
    init(name: String){
        self.name = name
        println("\(name) is being initialized.")
    }
    deinit {
        println("\(name) is being deinitialized.")
    }
}
var ref1: Person?
var ref2: Person?
var ref3: Person?
ref1 = Person(name: "John Appleseed")
ref2 = ref1
ref3 = ref1

ref1 = nil
ref2 = nil
//ARC does not deallocate the Person instance until the third and final strong reference is broken, at which point it is clear that you are no longer using the Person instance
ref3 = nil
//MARK:2. Strong Reference Cycles Between Class Instance
class Person2 {
    let name: String
    init (name: String){ self.name = name }
    var apartment: Apartment?
    deinit { println("\(name) is being deinitialized.") }
}
class Apartment {
    let number: Int
    init(number: Int){ self.number = number }
    var tenant: Person2?
    deinit{
        println("Apartment #\(number) is being deinitialized.")
    }
}
var john: Person2?
var number73: Apartment?
john = Person2(name: "John Appleseed")
number73 = Apartment(number: 73)
john!.apartment = number73
number73!.tenant = john
john = nil
number73 = nil
//MARK:3. Resolving Strong Reference Cycles Between Class Instances
class Person3 {
    let name: String
    init (name: String){ self.name = name }
    var apartment: Apartment2?
    deinit { println("\(name) is being deinitialized.") }
}
class Apartment2 {
    let number: Int
    init(number: Int){ self.number = number }
    weak var tenant: Person3?
    deinit{
        println("Apartment #\(number) is being deinitialized.")
    }
}
var john2: Person3?
var number74: Apartment2?
john2 = Person3(name: "John Appleseed2")
number74 = Apartment2(number: 74)
john2!.apartment = number74
number74!.tenant = john2
john2 = nil
number74 = nil
//MARK:4. Unowned References
class Customer {
    let name: String
    var card: CreditCard?
    init(name: String){
        self.name = name
    }
    deinit{
        println("\(name) is being deinitialized.")
    }
}
class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer){
        self.number = number
        self.customer = customer
    }
    deinit{
        println("Card #\(number) is being deinitialized.")
    }
}
var roger: Customer?
roger = Customer(name: "Roger")
roger!.card = CreditCard(number: 1234_5678_9012_3456, customer: roger!)
roger = nil
//Roger is being deinitialized.
//Card #1234567890123456 is being deinitialized.
//MARK:5. Unowned References and Implicitly Unwrapped Optional Properties
class Country {
    let name: String
    let capitalCity: City!
    init(name: String,captialName: String){
        self.name = name
        self.capitalCity = City(name: captialName, country: self)
    }
}
class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country){
        self.name = name
        self.country = country
    }
}
var country = Country(name: "Canada", captialName: "Ottawa")
println("\(country.name)'s captial city is called \(country.capitalCity.name)")
//MARK:6. Strong Reference Cycles for Closures
class HTMLElement {
    let name: String
    let text: String?
    
    lazy var asHTML: () -> String = {
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        }else{
            return "<\(self.name)/>"
        }
    }
    init(name: String, text: String? = nil){
        self.name = name
        self.text = text
    }
    deinit{
        println("\(name) is being deinitialized.")
    }
}
var paragraph: HTMLElement? = HTMLElement(name: "p", text: "Hello, world")
println(paragraph!.asHTML())
paragraph = nil
//MARK:7. Resolving Strong Reference Cycles for Closures
class HTMLElement2 {
    let name: String
    let text: String?
    
    lazy var asHTML: () -> String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        }else{
            return "<\(self.name)/>"
        }
    }
    init(name: String, text: String? = nil){
        self.name = name
        self.text = text
    }
    deinit{
        println("HTMLElement2 \(name) is being deinitialized.")
    }
}
var paragraph2: HTMLElement2? = HTMLElement2(name: "p2", text: "Hello, world")
println(paragraph2!.asHTML())
paragraph2 = nil





