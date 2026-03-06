import UIKit

//struct BasicInformation {
//    var name: String
//    var age: Int
//}
//
//var inseongInfo: BasicInformation = BasicInformation(name: "inseong", age: 24)
//
//inseongInfo.age = 25
//inseongInfo.name = "moon"
//
//let sebaInfo: BasicInformation = BasicInformation(name: "Seba", age: 99)
//sebaInfo.name = "inseong"
//jennyInfo.name = "inseong"

class Person {
    var height: Float = 0.0
    var weight: Float = 0.0
    
//    deinit {
//        print("Person 클래스의 인스턴스가 소멸됩니다.")
//    }
}

//var moon: Person = Person()
//moon.height = 171.4
//moon.weight = 62.4

//let kim: Person = Person()
//kim.height = 171.6
//kim.weight = 75.4

//var moon: Person? = Person()
//moon = nil

struct BasicInformation {
    let name: String
    var age: Int
}

var moonInfo: BasicInformation = BasicInformation(name: "moon", age: 24)
moonInfo.age = 25

print(moonInfo)
var friendInfo: BasicInformation = moonInfo

print("moon's age: \(moonInfo.age)")
print("friend's age: \(friendInfo.age)")

friendInfo.age = 999

print("moon's age: \(moonInfo.age)")
print("friend's age: \(friendInfo.age)")

var moon: Person = Person()
var friend: Person = moon

print("moon's height: \(moon.height)")
print("friend's height: \(friend.height)")

friend.height = 171.4
print("moon's height: \(moon.height)")
print("friend's height: \(friend.height)")

func changeBasicInfo(_ info: BasicInformation) {
    var copiedInfo: BasicInformation = info
    copiedInfo.age = 1
}

func changePersonInfo(_ info: Person) {
    info.height = 155.3
}

changeBasicInfo(moonInfo)
print("moon's age: \(moonInfo.age)")

changePersonInfo(moon)
print("moon's height: \(moon.height)")

var kim: Person = Person()
var shin: Person = kim

let anotherFriend: Person = Person()

print(kim === shin)
print(kim === anotherFriend)
print(friend !== anotherFriend)

print(3 != 3)


