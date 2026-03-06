import UIKit

//struct CoordinatePoint {
//    var x: Int
//    var y: Int
//}
//
//let moonPoint: CoordinatePoint = CoordinatePoint(x: 10, y: 5)
//
//class Position {
//    var point: CoordinatePoint
//    let name: String
//    
//    init(name: String, currentPoint: CoordinatePoint) {
//        self.name = name
//        self.point = currentPoint
//    }
//}
//
//let moonPosition: Position = Position(name: "moon", currentPoint: moonPoint)

//struct CoordinatePoint {
//    var x: Int = 0
//    var y: Int = 0
//}
//
//let moonPoint: CoordinatePoint = CoordinatePoint()
//let kimPoint: CoordinatePoint = CoordinatePoint(x: 10, y: 5)
//
//
//print("moon's point: \(moonPoint.x), \(moonPoint.y)")
//
//print("kim's Point: \(kimPoint.x), \(kimPoint.y)")
//
//class Position {
//    var point: CoordinatePoint = CoordinatePoint()
//    var name: String = "Unknown"
//}
//
//let moonPosition: Position = Position()
//moonPosition.name = "moon"

//struct CoordinatePoint {
//    var x: Int
//    var y: Int
//}
//
//class Position {
//    var point: CoordinatePoint?
//    let name: String
//    
//    init(name: String) {
//        self.name = name
//    }
//}

//let moonPosition: Position = Position(name: "moon")
//
//moonPosition.point = CoordinatePoint(x: 20, y: 10)

//struct CoordinatePoint {
//    var x: Int = 0
//    var y: Int = 0
//}
//
//class Position {
//    lazy var point: CoordinatePoint = CoordinatePoint()
//    let name: String
//    
//    init(name: String) {
//        self.name = name
//    }
//}
//
//let moonPosition: Position = Position(name: "moon")
//
//print(moonPosition.point)

//struct CoordinatePoint {
//    var x: Int
//    var y: Int
//    
//    func oppositePoint() -> Self {
//        return CoordinatePoint(x: -x, y: -y)
//    }
//    
//    mutating func setOppositePoint(_ opposite: CoordinatePoint) {
//        x = -opposite.x
//        y = -opposite.y
//    }
//}

//var moonPosition: CoordinatePoint = CoordinatePoint(x: 10, y: 20)
//
//print(moonPosition)
//
//print(moonPosition.oppositePoint())
//
//moonPosition.setOppositePoint(CoordinatePoint(x: 15, y: 10))
//print(moonPosition)

//struct CoordinatePoint {
//    var x: Int
//    var y: Int
//    
//    var oppositePoint: CoordinatePoint {
//        get {
//            CoordinatePoint(x: -x, y: -y)
//        }
//        
//        set {
//            x = -newValue.x
//            y = -newValue.y
//        }
//    }
//}

struct CoordinatePoint {
    var x: Int
    var y: Int
    
    var oppositePoint: CoordinatePoint {
        get {
            return CoordinatePoint(x: -x, y: -y)
        }
    }
}

var moonPosition: CoordinatePoint = CoordinatePoint(x: 10, y: 20)

print(moonPosition)

print(moonPosition.oppositePoint)

//moonPosition.oppositePoint = CoordinatePoint(x: 15, y: 10)
//print(moonPosition)

//class Account {
//    var credit: Int = 0 {
//        willSet {
//            print("잔액이 \(credit)원에서 \(newValue)원으로 변경될 예정입니다.")
//        }
//        didSet {
//            print("잔액이 \(oldValue)원에서 \(credit)원으로 변경되었습니다.")
//        }
//    }
//    
//    var dollarValue: Double {
//        get {
//            return Double(credit / 1000)
//        }
//        
//        set {
//            credit = Int(newValue * 1000)
//            print("잔액을 \(newValue)달러로 변경 중입니다.")
//        }
//    }
//}

//class ForeignAccount: Account {
//    override var dollarValue: Double {
//        willSet {
//            print("잔액이 \(dollarValue)달러에서 \(newValue)달러로 변경될 예정입니다.")
//        }
//        
//        didSet {
//            print("잔액이 \(oldValue)달러에서 \(dollarValue)달러로 변경되었습니다.")
//        }
//    }
//}
//
//let myAccount: ForeignAccount = ForeignAccount()
//myAccount.credit = 1000
//
//myAccount.dollarValue = 2
//
//var wonInPocket: Int = 2000 {
//    willSet {
//        print("주머니의 돈이 \(wonInPocket)원에서 \(newValue)원으로 변경될 예정입니다.")
//    }
//    
//    didSet {
//        print("주머니의 돈이 \(oldValue)원에서 \(wonInPocket)원으로 변경되었습니다.")
//    }
//}
//
//var dollarInPocket: Double {
//    get {
//        return Double(wonInPocket) / 1000.0
//    }
//    
//    set {
//        wonInPocket = Int(newValue * 1000.0)
//        print("주머니의 달러를 \(newValue)달러로 변경 중입니다.")
//    }
//}
//
//dollarInPocket = 3.5
//
//class AClass {
//    nonisolated(unsafe) static var typeProperty: Int = 0
//    
//    var instanceProperty: Int = 0 {
//        didSet {
//            AClass.typeProperty = instanceProperty + 100
//        }
//    }
//    
//    static var typeComputedProperty: Int {
//        get {
//            return typeProperty
//        }
//        
//        set {
//            typeProperty = newValue
//        }
//    }
//}
//
//AClass.typeProperty = 123
//
//let classInstance: AClass = AClass()
//classInstance.instanceProperty = 100
//
//print(AClass.typeProperty)
//print(AClass.typeComputedProperty)
//
//class Account {
//
//    static let dollarExchangeRate: Double = 1000.0
//    
//    var credit: Int = 0
//    
//    var dollarValue: Double {
//        get {
//            return Double(credit) / Self.dollarExchangeRate
//        }
//        
//        set {
//            credit = Int(newValue * Account.dollarExchangeRate)
//            print("잔액을 \(newValue)달러로 변경 중입니다.")
//        }
//    }
//}
//
//func someFunction(paramA: Any, paramB: Any) {
//    print("someFunction called...")
//}
//
//var functionReference = someFunction(paramA:paramB:)
//
//functionReference("A", "B")
////functionReference = anotherFunction(ParamA:ParamB)
//
//class Person {
//    var name: String
//    
//    init(name: String) {
//        self.name = name
//    }
//}
//
//struct Stuff {
//    var name: String
//    var owner: Person
//}

//print(type(of: \Person.name))
//print(type(of: \Stuff.name))
//
//let keyPath = \Stuff.owner
//let nameKeyPath = keyPath.appending(path: \.name)
//
//print(nameKeyPath)

//class Person {
//    let name: String
//    init(name: String) {
//        self.name = name
//    }
//}
//
//struct Stuff {
//    var name: String
//    var owner: Person
//}
//
//var moon = Person(name: "moon")
//let kim = Person(name: "kim")
//let macbook = Stuff(name: "MacBook Pro", owner: moon)
//var iMac = Stuff(name: "iMac", owner: moon)
//let iPhone = Stuff(name: "iPhone", owner: kim)
//
//let stuffNameKeyPath = \Stuff.name
//let ownerKeyPath = \Stuff.owner
//
//let ownerNameKeyPath = ownerKeyPath.appending(path: \.name)
//
//print(macbook[keyPath: stuffNameKeyPath])
//print(iMac[keyPath: stuffNameKeyPath])
//print(iPhone[keyPath: stuffNameKeyPath])
//
//print(macbook[keyPath: ownerNameKeyPath])
//print(iMac[keyPath: ownerNameKeyPath])
//print(iPhone[keyPath: ownerNameKeyPath])
//
//iMac[keyPath: stuffNameKeyPath] = "iMac Pro"
//iMac[keyPath: ownerKeyPath] = kim
//print(iMac[keyPath: stuffNameKeyPath])
//print(iMac[keyPath: ownerKeyPath])

//macbook[keyPath: stuffNameKeyPath] = "macbook pro touch bar"
//moon[keyPath: \Person.name] = "bear"

struct Person {
    let name: String
    let nickname: String?
    let age: Int
    
    var isAdult: Bool {
        return age > 18
    }
}

let yagom: Person = Person(name: "moon", nickname: "bear", age: 100)
let hana: Person = Person(name: "hana", nickname: "na", age: 100)
let happy: Person = Person(name: "happy", nickname: nil, age: 3)

let family: [Person] = [yagom, hana, happy]
let names: [String] = family.map(\.name)
let nicknames: [String] = family.compactMap(\.nickname)
let adults: [String] = family.filter(\.isAdult).map(\.name)

class LevelClass {
    var level: Int = 0 {
        didSet {
            print("Level \(level)")
        }
    }
    
    func levelUp() {
        print("Level UP!")
        level += 1
    }
    
    func levelDown() {
        print("Level Down")
        level -= 1
        if level < 0 {
            reset()
        }
    }
    
    func jumpLevel(to level: Int) {
        print("Jump to \(level)")
        self.level = level
    }
    
    func reset() {
        print("Reset!")
        level = 0
    }
}

var levelClassInstance: LevelClass = LevelClass()
levelClassInstance.levelUp()
levelClassInstance.levelDown()
levelClassInstance.levelDown()
levelClassInstance.jumpLevel(to: 3)

struct LevelStruct {
    var level: Int = 0
    
    mutating func levelUp() {
        print("Level Up!")
        level += 1
    }
    
    mutating func levelDown() {
        print("Level Down")
        level -= 1
        if level < 0 {
            reset()
        }
    }
    
    mutating func jumpLevel(to: Int) {
        print("Jump to \(to)")
        level = to
    }
    
    mutating func reset() {
        print("Reset!")
        self = LevelStruct()
    }
}

var levelStructInstance: LevelStruct = LevelStruct()
levelStructInstance.levelUp()
print(levelStructInstance.level)

levelStructInstance.reset()
print(levelStructInstance.level)

levelStructInstance.levelDown()
levelStructInstance.jumpLevel(to: 3)

enum OnOffSwitch {
    case on, off
    mutating func nextState() {
        self = self == .on ? .off : .on
    }
}

var toggle: OnOffSwitch = OnOffSwitch.off
toggle.nextState()
print(toggle)

struct Puppy {
    var name: String = "멍멍이"
    
    func callAsFunction() {
        print("멍멍")
    }
    
    func callAsFunction(destination: String) {
        print("\(destination)(으)로 달려갑니다")
    }
    
    func callAsFunction(something: String, times: Int) {
        print("\(something)(을)를 \(times)번 반복합니다.")
    }
    
    func callAsFunction(color: String) -> String {
        return "\(color) 응가"
    }
    
    mutating func callAsFunction(name: String) {
        self.name = name
    }
}

var doggy: Puppy = Puppy()
doggy()
doggy.callAsFunction(destination: "집")
doggy(destination: "뒷동산")
doggy(something: "재주넘기", times: 3)
print(doggy(color: "무지개색"))
doggy(name: "댕댕이")
print(doggy.name)

class AClass {
    static func staticTypeMethod() {
        print("AClass staticTypeMethod")
    }
    
    class func classTypeMethod() {
        print("AClass classTypeMethod")
    }
}

class BClass: AClass {
//    override static func staticTypeMethod() {
//
//    }
    
    override class func classTypeMethod() {
        print("BClass classTypeMethod")
    }
}

AClass.staticTypeMethod()
AClass.classTypeMethod()
BClass.classTypeMethod()

struct SystemVolume {
    nonisolated(unsafe) static var volume: Int = 5
    
    static func mute() {
        self.volume = 0
    }
}

class Navigation {
    var volume: Int = 5
    
    func guideWay() {
        SystemVolume.mute()
    }
    
    func finishGuideWay() {
        SystemVolume.volume = self.volume
    }
}

SystemVolume.volume = 10

let myNavi: Navigation = Navigation()

myNavi.guideWay()
print(SystemVolume.volume)

myNavi.finishGuideWay()
print(SystemVolume.volume)

struct CallablePerson {
    var name: String
    
    func callAsFunction() {
        print("제 이름은 \(name)입니다.")
    }
    
    func callAsFunction(friend: String) {
        print("저는 \(friend)와 친구입니다.")
    }
}

let moon: CallablePerson = CallablePerson(name: "moon")

moon()
moon(friend: "kim")
moon.callAsFunction()
moon.callAsFunction(friend: "moon")


