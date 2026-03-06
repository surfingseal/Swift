import UIKit

//class Person {
//    var name: String = ""
//    var age: Int = 0
//    
//    var introduction: String {
//        return "이름 : \(name). 나이: \(age)"
//    }
//    
//    func speak() {
//        print("가나다라마바사")
//    }
//    
//    class func introduceClass() -> String {
//        return "인류의 소원은 평화입니다."
//    }
//}
//
//class Student: Person {
//    var grade: String = "F"
//    
//    func study() {
//        print("study hard...")
//    }
//    
//    override func speak() {
//        print("저는 학생입니다.")
//    }
//}
//
//class UniversityStudent: Student {
//    var major: String = ""
//    
//    class func introduceClass() {
//        print(super.introduceClass)
//    }
//    
//    override class func introduceClass() -> String {
//        return "대학생의 소원은 A+"
//    }
//    
//    override func speak() {
//        super.speak()
//        print("대학생이죠")
//    }
//}

//let yagom: Person = Person()
//yagom.name = "yagom"
//yagom.age = 99
//print(yagom.introduction)
//yagom.speak()
//
//let moon: Student = Student()
//moon.name = "moon"
//moon.age = 24
//moon.grade = "A+"
//print(moon.introduction)
//moon.speak()
//moon.study()
//
//let jenny: UniversityStudent = UniversityStudent()
//jenny.major = "Computer Science"
//jenny.speak()
//jenny.study()

//let yagom: Person = Person()
//yagom.speak()
//
//let jay: Student = Student()
//jay.speak()
//
//let jenny: UniversityStudent = UniversityStudent()
//jenny.speak()
//
//print(Person.introduceClass())
//print(Student.introduceClass())
//print(UniversityStudent.introduceClass() as String)
//UniversityStudent.introduceClass() as Void

//class Person {
//    var name: String = ""
//    var age: Int = 0
//    var koreanAge: Int  {
//        return self.age + 1
//    }
//    
//    var introduction: String {
//        return "이름 : \(name). 나이 : \(age)"
//    }
//}
//
//class Student: Person {
//    var grade: String = "F"
//    
//    override var introduction: String {
//        return super.introduction + " " + "학점 : \(self.grade)"
//    }
//    
//    override var koreanAge: Int {
//        get {
//            return super.koreanAge
//        }
//        
//        set {
//            self.age = newValue - 1
//        }
//    }
//}
//
//let moon: Person = Person()
//moon.name = "moon"
//moon.age = 55
////moon.koreanAge = 56
//print(moon.introduction)
//print(moon.koreanAge)
//
//let jay: Student = Student()
//jay.name = "jay"
//jay.age = 14
//jay.koreanAge = 24
//print(jay.age)
//print(jay.introduction)
//print(jay.koreanAge)

//class Person {
//    var name: String = ""
//    var age: Int = 0 {
//        didSet {
//            print("Person age : \(self.age)")
//        }
//    }
//    var koreanAge: Int  {
//        return self.age + 1
//    }
//    
//    var fullName: String {
//        get {
//            return self.name
//        }
//        
//        set {
//            self.name = newValue
//        }
//    }
//}
//
//class Student: Person {
//    var grade: String = "F"
//    
//    override var age: Int {
//        didSet {
//            print("Student age : \(self.age)")
//        }
//    }
//    
//    override var koreanAge: Int {
//        get {
//            return super.koreanAge
//        }
//        
//        set {
//            self.age = newValue - 1
//        }
//        
////        didSet { }
//    }
//    
//    override var fullName: String {
//        didSet {
//            print("Full Name : \(self.fullName)")
//        }
//    }
//}
//
//let yagom: Person = Person()
//yagom.name = "yagom"
//yagom.age = 55
//yagom.fullName = "Jo yagom"
//print(yagom.koreanAge)
//
//let jay: Student = Student()
//jay.name = "jay"
//jay.age = 14
//jay.koreanAge = 15
//print(jay.age)
//jay.fullName = "Kim jay"
//print(jay.name)
//print(jay.koreanAge)
//
//class School {
//    var students: [Student] = [Student]()
//    
//    subscript(number: Int) -> Student {
//        print("School subscript")
//        return students[number]
//    }
//}
//
//class MiddleSchool: School {
//    var middleStudents: [Student] = [Student]()
//    
//    override subscript(index: Int) -> Student {
//        print("MiddleSchool subscript")
//        return middleStudents[index]
//    }
//}
//
//let university: School = School()
//university.students.append(Student())
//university[0]
//
//let middle: MiddleSchool = MiddleSchool()
//middle.middleStudents.append(Student())
//middle[0]

//class Person {
//    final var name: String = ""
//    
//    final func speak() {
//        print("가나다라마바사")
//    }
//}

//final class Student: Person {
//    override var name: String {
//        set {
//            super.name = newValue
//        }
//        
//        get {
//            return "학생"
//        }
//    }
//    
//    override func speak() {
//        print("저는 학생입니다.")
//    }
//}
//
//class UniversityStudent: Student {}

//class Person {
//    var name: String
//    var age: Int
//    
//    init(name: String, age: Int) {
//        self.name = name
//        self.age = age
//    }
//    
//    convenience init(name: String) {
//        self.init(name: name, age: 0)
//    }
//}
//
//class Student: Person {
//    var major: String
//    
//    override init(name: String, age: Int) {
//        self.major = "Swift"
//        super.init(name: name, age: age)
//    }
//    
//    convenience init(name: String) {
//        self.init(name: name, age: 7)
//    }
//}

//class Person {
//    var name: String
//    var age: Int
//    
//    init() {
//        self.name = "Unknown"
//        self.age = 0
//    }
//    
//    init?(name: String, age: Int) {
//        if name.isEmpty {
//            return nil
//        }
//        self.name = name
//        self.age = age
//    }
//    
//    init?(age: Int) {
//        if age < 0 {
//            return nil
//        }
//        self.name = "Unknown"
//        self.age = age
//    }
//}
//
//class Student: Person {
//    var major: String
//    
//    override init?(name: String, age: Int) {
//        self.major = "Swift"
//        super.init(name: name, age: age)
//    }
//    
//    override init(age: Int) {
//        self.major = "Swift"
//        super.init()
//    }
//}

//class Person {
//    var name: String
//
//    init(name: String) {
//        self.name = name
//    }
//
//    convenience init() {
//        self.init(name: "Unknown")
//    }
//}
//
//class Student: Person {
//    var major: String
//
//    override init(name: String) {
//        self.major = "Unknown"
//        super.init(name: name)
//    }
//
//    init(name: String, major: String) {
//        self.major = major
//        super.init(name: name)
//    }
//}

//let moon: Person = Person(name: "moon")
//let hana: Student = Student(name: "hana")
//print(moon.name)
//print(hana.name)
//
//let wizplan: Person = Person()
//let jinsung: Student = Student()
//print(wizplan.name)
//print(jinsung.name)

//let wizplan: Person = Person()
//let jinSung: Student = Student()
//print(wizplan.name)
//print(jinSung.name)
//
//class Person {
//    var name: String
//    
//    init(name: String) {
//        self.name = name
//    }
//    
//    convenience init() {
//        self.init(name: "Unknown")
//    }
//}
//
//class Student: Person {
//    var major: String
//    
//    convenience init(major: String) {
//        self.init()
//        
//        self.major = major
//    }
//    
//    override convenience init(name: String) {
//        self.init(name: name, major: "Unknown")
//    }
//    
//    init(name: String, major: String) {
//        self.major = major
//        super.init(name: name)
//    }
//}
//
//class UniversityStudent: Student {
//    var grade: String = "A+"
//    var description: String {
//        return "\(self.name) \(self.major) \(self.grade)"
//    }
//    
//    convenience init(name: String, major: String, grade: String) {
//        self.init(name: name, major: major)
//        self.grade = grade
//    }
//}
//
//let nova: UniversityStudent = UniversityStudent()
//print(nova.description)
//
//let raon: UniversityStudent = UniversityStudent(name: "raon")
//print(raon.description)
//
//let joker: UniversityStudent = UniversityStudent(name: "Joker", major: "Programming")
//print(joker.description)
//
//let chope: UniversityStudent = UniversityStudent(name: "chope", major: "Computer", grade: "C")
//print(chope.description)

//class Person {
//    var name: String
//    
//    required init() {
//        self.name = "Unknown"
//    }
//}
//
//class Student: Person {
//    var major: String = "Unknown"
//}
//
//let miJeong: Student = Student()

//class Person {
//    var name: String
//    
//    required init() {
//        self.name = "Unknown"
//    }
//}
//
//class Student: Person {
//    var major: String = "Unknown"
//    
//    init(major: String) {
//        self.major = major
//        super.init()
//    }
//    
//    required init() {
//        self.major = "Unknown"
//        super.init()
//    }
//}
//
//class UniversityStudent: Student {
//    var grade: String
//    
//    init(grade: String) {
//        self.grade = grade
//        super.init()
//    }
//    
//    required init() {
//        self.grade = "F"
//        super.init()
//    }
//}
//
//let jiSoo: Student = Student()
//print(jiSoo.major, jiSoo.name)
//
//let yagom: Student = Student(major: "Swift")
//print(yagom.major, yagom.name)
//
//let juHyun: UniversityStudent = UniversityStudent(grade: "A+")
//print(juHyun.major, juHyun.name, juHyun.grade)

//class Person {
//    var name: String
//    
//    init() {
//        self.name = "Unknown"
//    }
//}
//
//class Student: Person {
//    var major: String = "Unknown"
//    
//    init(major: String) {
//        self.major = major
//        super.init()
//    }
//    
//    required init() {
//        self.major = "Unknown"
//        super.init()
//    }
//}
//
//class UniversityStudent: Student {
//    var grade: String
//    
//    init(grade: String) {
//        self.grade = grade
//        super.init()
//    }
//    
//    required init() {
//        self.grade = "F"
//        super.init()
//    }
//}

class Person {
    var name: String
    
    init() {
        self.name = "Unknown"
    }
}

class Student: Person {
    var major: String = "Unknown"
    
    init(major: String) {
        self.major = major
        super.init()
    }
    
    required override init() {
        self.major = "Unknown"
        super.init()
    }
    
    required convenience init(name: String) {
        self.init()
        self.name = name
    }
}

class UniversityStudent: Student {
    var grade: String
    
    init(grade: String) {
        self.grade = grade
        super.init()
    }
    
    required init() {
        self.grade = "F"
        super.init()
    }
    
    required convenience init(name: String) {
        self.init()
        self.name = name
    }
}



