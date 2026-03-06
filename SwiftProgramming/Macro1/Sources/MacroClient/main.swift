import Macro

print("hello world")
let a = 17
let b = 25

let (result, code) = #stringify(a + 25)

print("The value \(result) was produced by the code \"\(code)\"")

let someInt = 3
let someDouble = 5.7
let doubledInt = #double(someInt)
let doubledDouble = #double(someDouble)

print("\(someInt)을 두 배 하면 \(doubledInt)이고, \(someDouble)을 두 배 하면 \(doubledDouble)입니다.")

#generateWeekEnum(named: "Week", cases: ["월", "화", "수", "목", "금", "토", "일"])

let monday: Week = .월

@AutoFactory
@AutoDescription
struct Car {
    let model: String
    let year: Int
    let isElectric: Bool
}

let myCar: Car = createCar(model: "번개카", year: 1998, isElectric: false)

print(myCar)

@AutoAccessors
class Person {
    var name: String
    private var _age: Int
    private var _height: Double
    var age: Int
    var height: Double
    
    init(name: String, age: Int, height: Double) {
        self.name = name
        self._age = age
        self._height = height
    }
}

let yagom: Person = .init(name: "yagom", age: 19, height: 183.5)
print(yagom.height)

@attached(extension, conformances: CustomStringConvertible, names: arbitrary)
public macro AutoDescription() = #externalMacro(module: "MacroMacros", type: "AutoDescriptionMacro")

