import UIKit

//class SomeClass {
//    init() {
//        
//    }
//}

struct SomeStruct {
    init() {
        
    }
}

enum SomeEnum {
    case someCase
    
    init() {
        self = .someCase
    }
}

//struct Area {
//    var squareMeter: Double
//    
//    init() {
//        squareMeter = 0.0
//    }
//}
//
//let room: Area = Area()
//print(room.squareMeter)

//struct Area {
//    var squareMeter: Double = 0.0
//}
//
//let room: Area = Area()
//print(room.squareMeter)

struct Area {
    var squareMeter: Double
    
    init(fromPy py: Double) {
        squareMeter = py * 3.3058
    }
    
    init(fromSquareMeter squareMeter: Double) {
        self.squareMeter = squareMeter
    }
    
    init(value: Double) {
        squareMeter = value
    }
    
    init(_ value: Double) {
        squareMeter = value
    }
}

let roomOne: Area = Area(fromPy: 15.0)
print(roomOne.squareMeter)

let roomTwo: Area = Area(fromSquareMeter: 33.06)
print(roomTwo.squareMeter)

let roomThree: Area = Area(value: 30.0)
let roomFour: Area = Area(55.0)

//Area()

//class Person {
//    var name: String
//    var age: Int?
//    
//    init(name: String) {
//        self.name = name
//    }
//}
//
//let moon: Person = Person(name: "moon")
//print(moon.name)
//print(moon.age)
//
//moon.age = 99
//print(moon.age)
//
//moon.name = "kim"
//print(moon.name)

//class Person {
//    let name: String
//    var age: Int?
//    
//    init(name: String) {
//        self.name = name
//    }
//}
//
//let moon: Person = Person(name: "moon")

struct Point {
    var x: Double = 0.0
    var y: Double = 0.0
}

struct Size {
    var width: Double = 0.0
    var height: Double = 0.0
}

let point: Point = Point(x: 0, y: 0)
let size: Size = Size(width: 50.0, height: 50.0)

let somePoint: Point = Point()
let someSize: Size = Size(width: 50)
let anotherPoint: Point = Point(y: 100)

print(someSize)
print(anotherPoint)

//enum Student {
//    case elementary, middle, high
//    case none
//    
//    init() {
//        self = .none
//    }
//    
//    init(koreanAge: Int) {
//        switch koreanAge {
//        case 8...13:
//            self = .elementary
//        case 14...16:
//            self = .middle
//        case 17...19:
//            self = .high
//        default:
//            self = .none
//        }
//    }
//    
//    init(bornAt: Int, currentYear: Int) {
//        self.init(koreanAge: currentYear - bornAt + 1)
//    }
//}

//var younger: Student = Student(koreanAge: 16)
//print(younger)
//
//younger = Student(bornAt: 1998, currentYear: 2016)
//print(younger)

class Person {
    let name: String
    var age: Int?
    
    init?(name: String) {
        
        if name.isEmpty {
            return nil
        }
        
        self.name = name
    }
    
    init?(name: String, age: Int) {
        if name.isEmpty || age < 0 {
            return nil
        }
        self.name = name
        self.age = age
    }
}

let yagom: Person? = Person(name: "yagom", age: 99)

if let person: Person = yagom {
    print(person.name)
} else {
    print("Person wasn't initialized")
}

let chope: Person? = Person(name: "chope", age: -10)

if let person: Person = chope {
    print(person.name)
} else {
    print("Person wasn't initialized")
}

let eric: Person? = Person(name: "", age: 30)

if let person: Person = eric {
    print(person.name)
} else {
    print("Person wasn't initialized")
}

//enum Student: String {
//    case elementary = "초등학생", middle = "중학생", high = "고등학생"
//    
//    init?(koreanAge: Int) {
//        switch koreanAge {
//        case 8...13:
//            self = .elementary
//        case 14...16:
//            self = .middle
//        case 17...19:
//            self = .high
//        default:
//            return nil
//        }
//    }
//    
//    init?(bornAt: Int, currentYear: Int) {
//        self.init(koreanAge: currentYear - bornAt + 1)
//    }
//}
//
//var younger: Student? = Student(koreanAge: 20)
//print(younger)
//
//younger = Student(bornAt: 2020, currentYear: 2016)
//print(younger)
//
//younger = Student(rawValue: "대학생")
//print(younger)
//
//younger = Student(rawValue: "고등학생")
//print(younger)

//class SomeClass {
//    let someProperty: SomeType = {
//        return someValue
//    }()
//}

struct Student {
    var name: String?
    var number: Int?
}

class SchoolClass {
    var students: [Student] = {
        var arr: [Student] = [Student]()
        
        for num in 1...15 {
            var student: Student = Student(name: nil, number: num)
            arr.append(student)
        }
        
        return arr
    }()
}

let myClass: SchoolClass = SchoolClass()
print(myClass.students.count)

class SomeClass {
    deinit {
        print("Instance will be deallocated immediately")
    }
}

var instance: SomeClass? = SomeClass()
instance = nil

class FileManager {
    var fileName: String
    
    init(fileName: String) {
        self.fileName = fileName
    }
    
    func openFile() {
        print("Open File: \(self.fileName)")
    }
    
    func modifyFile() {
        print("Modify File: \(self.fileName)")
    }
    
    func writeFile() {
        print("Write File: \(self.fileName)")
    }
    
    func closeFile() {
        print("Close File: \(self.fileName)")
    }
    
    deinit {
        print("Deinit instance")
        self.writeFile()
        self.closeFile()
    }
}

var fileManager: FileManager? = FileManager(fileName: "abc.txt")

if let manager: FileManager = fileManager {
    manager.openFile()
    manager.modifyFile()
}

fileManager = nil
