import UIKit

//class Person {
//    let name: String
//    
//    init(name: String) {
//        self.name = name
//        print("\(name) is being initialized")
//    }
//    
//    deinit {
//        print("\(name) is being deinitialized")
//    }
//}
//
//var reference1: Person?
//var reference2: Person?
//var reference3: Person?
//
//reference1 = Person(name: "yagom")
//reference2 = reference1
//reference3 = reference1
//
//reference3 = nil
//reference2 = nil
//reference1 = nil
//
////func foo() {
////    let yagom: Person = Person(name: "yagom")
////}
////
////foo()
//
//var globalReference: Person?
//
//@MainActor
//func foo() {
//    let yagom: Person = Person(name: "yagom")
//    
//    globalReference = yagom
//}
//
//foo()

//class Person {
//    let name: String
//    
//    init(name: String) {
//        self.name = name
//    }
//    
//    var room: Room?
//    
//    deinit {
//        print("\(name) is being deinitialized")
//    }
//}
//
//class Room {
//    let number: String
//    
//    init(number: String) {
//        self.number = number
//    }
//    
//    var host: Person?
//    
//    deinit {
//        print("Room \(number) is being deinitialized")
//    }
//}

//var yagom: Person? = Person(name: "yagom")
//var room: Room? = Room(number: "505")
//
//room?.host = yagom
//yagom?.room = room
//
//yagom = nil
//room = nil

//var yagom: Person? = Person(name: "yagom")
//var room: Room? = Room(number: "505")
//
//room?.host = yagom
//yagom?.room = room
//
//yagom?.room = nil
//yagom = nil
//
//room?.host = nil
//room = nil

//class Person {
//    let name: String
//    
//    init(name: String) {
//        self.name = name
//    }
//    
//    var room: Room?
//    
//    deinit {
//        print("\(name) is being deinitialized")
//    }
//}
//
//class Room {
//    let number: String
//    
//    init(number: String) {
//        self.number = number
//    }
//    
//    weak var host: Person?
//    
//    deinit {
//        print("Room \(number) is being deinitialized")
//    }
//}
//
//var yagom: Person? = Person(name: "yagom")
//var room: Room? = Room(number: "505")
//
//room?.host = yagom
//yagom?.room = room
//
//yagom = nil
//print(room?.host)
//
//room = nil

//class Person {
//    let name: String
//    
//    var card: CreditCard?
//    
//    init(name: String) {
//        self.name =  name
//    }
//    
//    deinit { print("\(name) is being deinitialized")}
//}
//
//class CreditCard {
//    let number: UInt
//    unowned let owner: Person
//    
//    init(number: UInt, owner: Person) {
//        self.number = number
//        self.owner = owner
//    }
//    
//    deinit {
//        print("Card #\(number) is being deinitialized")
//    }
//}
//
//var jisoo: Person? = Person(name: "jisoo")
//
//if let person: Person = jisoo {
//    person.card = CreditCard(number: 1004, owner: person)
//}

//jisoo = nil

class Department {
    var name: String
    var subject: [Subject] = []
    init(name: String) {
        self.name = name
    }
}

class Subject {
    var name: String
    unowned var department: Department
    unowned var nextSubject: Subject?
    init(name: String, in department: Department) {
        self.name = name
        self.department = department
        self.nextSubject = nil
    }
}

let department = Department(name: "Computer Science")

let intro = Subject(name: "Computer Architecture", in: department)
let intermediate = Subject(name: "Swift Language", in: department)
let advanced = Subject(name: "iOS App Programming", in: department)

intro.nextSubject = intermediate
intermediate.nextSubject = advanced
department.subject = [intro, intermediate, advanced]

class Company {
    let name: String
    
    var ceo: CEO!
    
    init(name: String, ceoName: String) {
        self.name = name
        self.ceo = CEO(name: ceoName, company: self)
    }
    
    func introduce() {
        print("\(name)의 CEO는 \(ceo.name)입니다.")
    }
}

class CEO {
    let name: String
    unowned let company: Company
    init(name: String, company: Company) {
        self.name = name
        self.company = company
    }
    
    func introduce() {
        print("\(name)는 \(company.name)의 CEO입니다.")
    }
}

let company: Company = Company(name: "무한상사", ceoName: "김태호")
company.introduce()
company.ceo.introduce()

//class Person {
//    let name: String
//    let hobby: String?
//    
//    lazy var introduce: () -> String = {
//        var introduction: String = "My name is \(self.name)."
//        guard let hobby = self.hobby else {
//            return introduction
//        }
//        
//        introduction += " "
//        introduction += "My Hobby is \(hobby)."
//        
//        return introduction
//    }
//    
//    init(name: String, hobby: String? = nil) {
//        self.name = name
//        self.hobby = hobby
//    }
//    
//    deinit {
//        print("\(name) is being deinitialized")
//    }
//}
//
//var yagom: Person? = Person(name: "yagom", hobby: "eating")
//print(yagom?.introduce())
//yagom = nil

//var a = 0
//var b = 0
//
//let closure = { [a] in
//    print(a, b)
//    b = 20
//}
//
//a = 10
//b = 10
//closure()
//print(b)

//class SimpleClass {
//    var value: Int = 0
//}

//var x = SimpleClass()
//var y = SimpleClass()
//
//let closure = { [x] in
//    print(x.value, y.value)
//}
//
//x.value = 10
//y.value = 10
//
//closure()

//var x: SimpleClass? = SimpleClass()
//var y = SimpleClass()
//
//let closure = { [weak x, unowned y] in
//    print(x?.value, y.value)
//}
//
//x = nil
//y.value = 10

//closure()

//class Person {
//    let name: String
//    let hobby: String?
//    
//    lazy var introduce: () -> String = { [unowned self] in
//        var introduction: String = "My Name is \(self.name)."
//        
//        guard let hobby = self.hobby else {
//            return introduction
//        }
//        
//        introduction += " "
//        introduction += "My hobby is \(hobby)."
//        return introduction
//    }
//    
//    init(name: String, hobby: String? = nil) {
//        self.name = name
//        self.hobby = hobby
//    }
//    
//    deinit {
//        print("\(name) is being initialized")
//    }
//}

//var yagom: Person? = Person(name: "yagom", hobby: "eating")
//print(yagom?.introduce)
//yagom = nil

//var yagom: Person? = Person(name: "yagom", hobby: "eating")
//var hana: Person? = Person(name: "hana", hobby: "playing guitar")
//
//hana?.introduce = yagom?.introduce ?? {" "}
//
//print(yagom?.introduce())
//
//yagom = nil
//
//print(hana?.introduce())

class Person {
    let name: String
    let hobby: String?
    
    lazy var introduce: () -> String = { [weak self] in
        
        guard let `self` = self else {
            return "원래의 참조 인스턴스가 없어졌습니다."
        }
        
        var introduction: String = "My Name is \(self.name)."
        
        guard let hobby = self.hobby else {
            return introduction
        }
        
        introduction += " "
        introduction += "My hobby is \(hobby)."
        
        return introduction
    }
    
    init(name: String, hobby: String? = nil) {
        self.name = name
        self.hobby = hobby
    }
    
    deinit {
        print("\(name) is being initialized")
    }
}

var yagom: Person? = Person(name: "yagom", hobby: "eating")
var hana: Person? = Person(name: "hana", hobby: "playing guitar")

hana?.introduce = yagom?.introduce ?? {" "}
print(yagom?.introduce())

yagom = nil

print(hana?.introduce())
