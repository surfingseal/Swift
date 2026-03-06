import UIKit

//protocol SomeProtocol {
//    var settableProperty: String { get set }
//    var notNeedToBeSettableProperty: String { get }
//}
//
//protocol AnotherProtocol {
//    static var someTypeProperty: Int { get set }
//    static var anotherTypeProperty: Int { get }
//}
//
//protocol Sendable {
//    var from: String { get }
//    var to: String { get }
//}
//
//class Message: Sendable {
//    var sender: String
//    var from: String {
//        return self.sender
//    }
//    
//    var to: String
//    
//    init(sender: String, receiver: String) {
//        self.sender = sender
//        self.to = receiver
//    }
//}
//
//class Mail: Sendable {
//    var from: String
//    var to: String
//    
//    init(sender: String, receiver: String) {
//        self.from = sender
//        self.to = receiver
//    }
//}

protocol Receivable {
    func received(data: Any, from: Sendable)
}

protocol Sendable {
    var from: any Sendable { get }
    var to: Receivable? { get }
    
    func send(data: Any)
    
    static func isSendableInstance(_ instance: Any) -> Bool
}

class Message: Sendable, Receivable {
    var from: any Sendable {
        return self
    }
    
    var to: Receivable?
    
    func send(data: Any) {
        guard let receiver: Receivable = self.to else {
            print("Message has no receiver")
            return
        }
        
        receiver.received(data: data, from: self.from)
    }
    
    func received(data: Any, from: any Sendable) {
        print("Message received \(data) from \(from)")
    }
    
    class func isSendableInstance(_ instance: Any) -> Bool {
        if let sendableInstance: any Sendable = instance as? any Sendable {
            return sendableInstance.to != nil
        }
        return false
    }
}

class Mail: Sendable, Receivable {
    var from: any Sendable {
        return self
    }
    
    var to: Receivable?
    
    func send(data: Any) {
        guard let receiver: Receivable = self.to else {
            print("Mail has no receiver")
            return
        }
        receiver.received(data: data, from: self.from)
    }

    func received(data: Any, from: any Sendable) {
        print("Mail received \(data) from \(from)")
    }
    
    static func isSendableInstance(_ instance: Any) -> Bool {
        if let sendableInstance: any Sendable = instance as? any Sendable {
            return sendableInstance.to != nil
        }
        return false
    }
}

let myPhoneMessage: Message = Message()
let yourPhoneMessage: Message = Message()

myPhoneMessage.send(data: "Hello")

myPhoneMessage.to = yourPhoneMessage
myPhoneMessage.send(data: "Hello")

let myMail: Mail = Mail()
let yourMail: Mail = Mail()

myMail.send(data: "Hi")

myMail.to = yourMail
myMail.send(data: "Hi")

myMail.to = myPhoneMessage
myMail.send(data: "Bye")

Message.isSendableInstance("Hello")

Message.isSendableInstance(myPhoneMessage)

Message.isSendableInstance(yourPhoneMessage)
Mail.isSendableInstance(myPhoneMessage)
Mail.isSendableInstance(myMail)

protocol Resettable {
    mutating func reset()
}

//class Person: Resettable {
//    var name: String?
//    var age: Int?
//    func reset() {
//        self.name = nil
//        self.age = nil
//    }
//}

struct Point: Resettable {
    var x: Int = 0
    var y: Int = 0
    
    mutating func reset() {
        self.x = 0
        self.y = 0
    }
}

enum Direction: Resettable {
    case east, west, north, unknown
    
    mutating func reset() {
        self = Direction.unknown
    }
}

//protocol Named {
//    var name: String { get }
//    
//    init(name: String)
//}
//
//struct Pet: Named {
//    var name: String
//    
//    init(name: String) {
//        self.name = name
//    }
//}
//
////class Person: Named {
////    var name: String
////    
////    required init(name: String) {
////        self.name = name
////    }
////}
//
//final class Person: Named {
//    var name: String
//    
//    init(name: String) {
//        self.name = name
//    }
//}
//
//class School {
//    var name: String
//    
//    init(name: String) {
//        self.name = name
//    }
//}
//
//class MiddleSchool: School, Named {
//    required override init(name: String) {
//        super.init(name: name)
//    }
//}

protocol Named {
    var name: String { get }
    
    init?(name: String)
}

struct Animal: Named {
    var name: String
    
    init!(name: String) {
        self.name = name
    }
}

struct Pet: Named {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Person: Named {
    var name: String
    
    required init(name: String) {
        self.name = name
    }
}

class School: Named {
    var name: String
    
    required init?(name: String) {
        self.name = name
    }
}
//
//protocol Readable {
//    func read()
//}
//
//protocol Writable {
//    func write()
//}
//
//protocol ReadSpeakable: Readable {
//    func speak()
//}
//
//protocol ReadWriteSpeakable: Readable, Writable {
//    func speak()
//}
//
//class SomeClas: ReadWriteSpeakable {
//    func read() {
//        print("Read")
//    }
//    
//    func write() {
//        print("Write")
//    }
//    
//    func speak() {
//        print("Speak")
//    }
//}
//
//protocol ClassOnlyProtocol: AnyObject, Readable, Writable {
//    
//}
//
//class SomeClass: ClassOnlyProtocol {
//    func read() { }
//    func write() { }
//}

//struct SomeStruct: ClassOnlytProtocol {
//    func read() { }
//    func write() { }
//}

//protocol Named {
//    var name: String { get }
//}
//
//protocol Aged {
//    var age: Int { get }
//}
//
//struct Person: Named, Aged {
//    var name: String
//    var age: Int
//}
//
//class Car: Named {
//    var name: String
//    
//    init(name: String) {
//        self.name = name
//    }
//}
//
//class Truck: Car, Aged {
//    var age: Int
//    
//    init(name: String, age: Int) {
//        self.age = age
//        super.init(name: name)
//    }
//}
//
//func celebrateBirthday(to celebrator: any Named & Aged) {
//    print("Happy birthday \(celebrator.name)!! Now you are \(celebrator.age)")
//}
//
//let yagom: Person = Person(name: "yagom", age: 99)
//celebrateBirthday(to: yagom)
//
//let myCar: Car = Car(name: "Boong Boong")
////celebrateBirthday(to: myCar)
//
////var someVariable: any Car & Truck & Aged
//
//var someVariable: any Car & Aged
//
//someVariable = Truck(name: "Truck", age: 5)
//
////someVariable = myCar
//
//print(yagom is Named)
//print(yagom is Aged)
//
//print(myCar is Named)
//print(myCar is Aged)
//
//if let castedInstance: any Named = yagom as? Named {
//    print("\(castedInstance) is Named")
//}
//
//if let castedInstance: any Aged = yagom as? Aged {
//    print("\(castedInstance) is Aged")
//}
//
//if let castedInstance: any Named = myCar as? Named {
//    print("\(castedInstance) is Aged")
//}
//
//if let castedInstance: any Aged = myCar as? Aged {
//    print("\(castedInstance) is Aged")
//}
//
//import Foundation
//
//@objc protocol Moveable {
//    func walk()
//    @objc optional func fly()
//}
//
//class Tiger: NSObject, Moveable {
//    func walk() {
//        print("Tiger walks")
//    }
//}
//
//class Bird: NSObject, Moveable {
//    func walk() {
//        print("Bird walks")
//    }
//    
//    func fly() {
//        print("Birds flies")
//    }
//}
//
//let tiger: Tiger = Tiger()
//let bird: Bird = Bird()
//
//tiger.walk()
//bird.walk()
//bird.fly()

//var movableInstance: any Moveable = tiger
//movableInstance.fly?()
//
//movableInstance = bird
//movableInstance.fly?()

var someNamed: any Named = Animal(name: "Animal")
someNamed = Pet(name: "Pet")
someNamed = Person(name: "Person")
someNamed = School(name: "School") ?? Person(name: "Student")

func sayHello(to named: any Named) {
    print("Hello, \(named.name)!!")
}

