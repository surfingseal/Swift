import UIKit

//var myName: String = "Moon"
//myName = nil

//var myName: String? = "Moon"
//var myName: Optional<String> = "Moon"
//print(myName)
//
//myName = nil
//print(myName)

func checkOptionalValue(value optionalValue: Any?) {
    switch optionalValue {
    case .none:
        print("This optional variable is nil")
    case .some(let value):
        print("Value is \(value)")
    }
}

//var myName: String? = "Moon"
//checkOptionalValue(value: myName)
//
//myName = nil
//checkOptionalValue(value: myName)

let numbers: [Int?] = [2, nil, -4, nil, 100]

for number in numbers {
    switch number {
    case .some(let value) where value < 0:
        print("Negative value!! \(value)")
    case .some(let value) where value > 10:
        print("Large value!! \(value)")
        
    case .some(let value):
        print("Value \(value)")
        
    case .none:
        print("nil")
    }
}

//var myName: String? = "Moon"
//var yourName: String? = nil
//
//var moon: String = myName!
//
//print(moon)
//
////myName = nil
////moon = myName!
//
//if myName != nil {
//    print("My name is \(myName!)")
//} else {
//    print("myName == nil")
//}
//
//if let name = myName {
//    print("My name is \(name)")
//} else {
//    print("myName == nil")
//}
//
//if var name = myName {
//    name = "wizplan"
//    print("My name is \(name)")
//} else {
//    print("myName == nil")
//}
//
//if let myName {
//    print("My name is \(myName)")
//} else {
//    print("myName == nil")
//}
//
//if let name = myName, let friend = yourName {
//    print("We are friend! \(name) & \(friend)")
//}
//
//yourName = "eric"
//
//if let name = myName, let friend = yourName {
//    print("We are friend! \(name) & \(friend)")
//}

var myName: String! = "Moon"
print(myName)
myName = nil
if let name = myName {
    print("My name is \(name)")
} else {
    print("myName == nil")
}

myName.isEmpty
