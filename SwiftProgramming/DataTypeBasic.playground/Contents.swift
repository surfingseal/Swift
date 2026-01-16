import UIKit

var name = "Kwanhee"

//name = 100

typealias MyInt = Int
typealias YourInt = Int
typealias MyDouble = Double

let age: MyInt = 100
var year: YourInt = 2080

year = age

let month: Int = 7
let percentage: MyDouble = 99.9

var person: (String, Int, Double) = ("moon", 62, 171)

print("이름: \(person.0), 몸무게: \(person.1), 신장: \(person.2)")

person.1 = 72
person.2 = 180

print("이름: \(person.0), 몸무게: \(person.1), 신장: \(person.2)")

var person2: (name: String, weight: Int, height: Double) = ("moon", 62, 171.5)

print("이름: \(person2.name), 몸무게: \(person2.weight), 신장: \(person2.height)")

person2.weight = 72
person2.2 = 180

print("이름: \(person2.0), 몸무게: \(person2.weight), 신장: \(person2.2)")

typealias PersonTuple = (name: String, weight: Int, height: Double)

let moon: PersonTuple = ("moon", 62, 171.5)
let kim: PersonTuple = ("kim", 68, 176.2)

print("이름: \(moon.name), 몸무게: \(moon.weight), 신장: \(moon.height)")
print("이름: \(kim.name), 몸무게: \(kim.weight), 신장: \(kim.height)")

var names: Array<String> = ["moon", "kim", "shin"]
var names2: [String] = ["moon", "kim", "shin"]

var emptyArray: [Any] = [Any]()
var emptyarray2: [Any] = Array<Any>()
var emptyArray3: Array<Any> = []
//var emptyArray4 = []

print(emptyArray.isEmpty)
print(names.count)

print(names[2])
names[2] = "jenny"
print(names[2])
//print(names[4])

//names[4] = "print"
names.append("elsa")
print(names)
names.append(contentsOf: ["han", "soo"])
print(names)
names.insert("minsu", at: 2)
print(names)
names.insert(contentsOf: ["seok", "hoo"], at: 4)
print(names)

print(names[0])
print(names.firstIndex(of: "moon"))
print(names.firstIndex(of: "chris"))
print(names.first)
print(names.last)

print(names)

let firstItem: String = names.removeFirst()
print(names)

let lastItem: String = names.removeLast()
print(names)

let indexZeroItem: String = names.remove(at: 0)
print(names)

print(firstItem)
print(lastItem)
print(indexZeroItem)
print(names[1...3])

typealias StringIntDictionary = [String: Int]
typealias IntStringDictionary = Dictionary<Int, String>

var numberForName: Dictionary<String, Int> = Dictionary<String, Int>()
var numberForName2: [String: Int] = [String: Int]()

var numberForName3: StringIntDictionary = StringIntDictionary()

var numberForName4: [String: Int] = [:]

var numberForName5: [String: Int] = ["moon": 100, "kim": 200, "shin": 300]

print(numberForName.isEmpty)
print(numberForName.count)

print(numberForName5["moon"])
print(numberForName5["minji"])

numberForName5["moon"] = 1000
print(numberForName5)

numberForName5["shim"] = 1200
print(numberForName5)

print(numberForName5.removeValue(forKey: "shim"))
print(numberForName5)

print(numberForName5["shim"])

print(numberForName5["shim", default: 0])

let array: [Int] = [1, 2, 3]

var namesSet: Set<String> = Set<String>()
var namesSet2: Set<String> = []

var namesSet3: Set<String> = ["moon", "chulsoo", "younghee", "moon"]
print(namesSet3)

var numbers = [100, 200, 300]
print(type(of: numbers))

print(namesSet.isEmpty)
print(namesSet3.count)

print(namesSet3.count)
namesSet3.insert("jenny")
print(namesSet3.count)
print(namesSet3)

print(namesSet3.remove("jenny"))
print(namesSet3.remove("john"))

let englishClassStudents: Set<String> = ["john", "chulsoo", "yagom"]
let koreanClassStudents: Set<String> = ["jenny", "yagom", "chulsoo", "hana", "minsoo"]

let intersectSet: Set<String> = englishClassStudents.intersection(koreanClassStudents)
print(intersectSet)

let symmetricDiffSet: Set<String> = englishClassStudents.symmetricDifference(koreanClassStudents)
print(symmetricDiffSet)

let unionSet: Set<String> = englishClassStudents.union(koreanClassStudents)

let subtractSet: Set<String> = englishClassStudents.subtracting(koreanClassStudents)
print(subtractSet)

print(unionSet.sorted())

let 새: Set<String> = ["비둘기", "닭", "기러기"]
let 포유류: Set<String> = ["사자", "호랑이", "곰"]
let 동물: Set<String> = 새.union(포유류)

print(새.isDisjoint(with: 포유류))
print(새.isSubset(of: 동물))
print(동물.isSuperset(of: 포유류))
print(동물.isSuperset(of: 새))

var array2: [Int] = [0, 1, 2, 3, 4]
var set2: Set<Int> = [0, 1, 2, 3, 4]
var dictionary2: [String: Int] = ["a": 1, "b": 2, "c": 3]
var string2: String = "String"

print(array2.randomElement())
print(array2.shuffled())
print(array2)
array2.shuffle()
print(array2)

print(set2.shuffled())
//set2.shuffle()
print(dictionary2.shuffled())
print(string2.shuffled())

enum School: String {
    case primary = "유치원"
    case elementary = "초등학교"
    case middle = "중학교"
    case high = "고등학교"
    case college
    case university
    case graduate
}

enum School2 {
    case primary, elementary, middle, high, college, university, graduate
}

var highestEducationLevel: School = School.university
print("저의 최종 학력은 \(highestEducationLevel.rawValue) 졸업입니다.")

var highestEducatinLevel2: School = .university

highestEducationLevel = .graduate

enum WeekDays: Character {
    case mon = "월", tue = "화", wed = "수", thu = "목", fri = "금", sat = "토", sun = "일"
}

let today: WeekDays = .fri
print("오늘은 \(today.rawValue)요일입니다.")
print(today)

print(School.elementary.rawValue)

enum Numbers: Int {
    case zero = 2
    case one
    case two
    case ten = 10
}

var zeroNumber = Numbers.zero
print(zeroNumber)



print("\(Numbers.zero.rawValue), \(Numbers.one.rawValue), \(Numbers.two.rawValue), \(Numbers.ten.rawValue)")

let primary = School(rawValue: "유치원")
print(primary)

let graduate = School(rawValue: "석박사")
print(graduate)

enum MainDish {
    case pasta(String)
    case pizza(dough: String, topping: String)
    case chicken(withSauce: Bool)
    case rice
}

var dinner: MainDish = .pasta("크림")
print(dinner)
dinner = .pizza(dough: "치즈크러스트", topping: "불고기")
dinner = .chicken(withSauce: true)
dinner = .rice

enum PastaTaste: CaseIterable {
    case cream, tomato
}

enum PizzaDough: CaseIterable {
    case cheeseCrust, thin, original
}

enum PizzaTopping: CaseIterable {
    case pepperoni, cheese, bacon
}

enum MainDish2: CaseIterable {
    case pasta(taste: PastaTaste)
    case pizza(dough: PizzaDough, topping: PizzaTopping)
    case chicken(withSauce: Bool)
    case rice
    
    static var allCases: [MainDish2] {
        return PastaTaste.allCases.map(MainDish2.pasta)
        + PizzaDough.allCases.reduce([]) { (result, dough) -> [MainDish2] in
            result + PizzaTopping.allCases.map { (topping) -> MainDish2 in
                MainDish2.pizza(dough: dough, topping: topping)
            }
        }
        + [true, false].map(MainDish2.chicken)
        + [MainDish2.rice]
    }
}

print(MainDish2.allCases.count)
print(MainDish2.allCases)

var dinner2: MainDish2 = MainDish2.pasta(taste: PastaTaste.tomato)
dinner2 = MainDish2.pizza(dough: PizzaDough.cheeseCrust, topping: PizzaTopping.bacon)

enum School3: String, CaseIterable {
    case primary = "유치원"
    case elementary = "초등학교"
    case middle = "중학교"
    case high = "고등학교"
    case college = "대학"
    case university = "대학교"
    @available(iOS, obsoleted: 12.0)
    case graduate = "대학원"
    
    static var allCases: [School3] {
        let all: [School3] = [.primary,
                             .elementary,
                             .middle,
                             .high,
                             .college,
                             .university]
        
        #if os(iOS)
        return all
        #else
        return all + [.graduate]
        #endif
    }
}

let allCases: [School3] = School3.allCases
print(allCases)

//enum ArithmeticExpression {
//    case number(Int)
//    indirect case addition(ArithmeticExpression, ArithmeticExpression)
//    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
//}

indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let final = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case .number(let value):
        return value
    case .addition(let left, let right):
        return evaluate(left) + evaluate(right)
    case .multiplication(let left, let right):
        return evaluate(left) * evaluate(right)
    }
}

let result: Int = evaluate(final)
print("(5 + 4) * 2 = \(result)")

enum Condition: Comparable {
    case terrible
    case bad
    case good
    case great
}

let myCondition: Condition = Condition.great
let yourCondition: Condition = Condition.bad

if myCondition >= yourCondition {
    print("제 상태가 더 좋군요")
} else {
    print("당신의 상태가 더 좋아요")
}

enum Device: Comparable {
    case iPhone(version: String)
    case iPad(version: String)
    case macBook
    case iMac
}

var devices: [Device] = []
devices.append(Device.iMac)
devices.append(Device.iPhone(version: "14.3"))
devices.append(Device.iPhone(version: "6.1"))
devices.append(Device.iPad(version: "10.3"))
devices.append(Device.macBook)

let sortedDevices: [Device] = devices.sorted()
print(sortedDevices)

