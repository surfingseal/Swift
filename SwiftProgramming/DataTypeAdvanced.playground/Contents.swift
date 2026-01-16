var name: String = "인성"
var age: Int = 24
var job = "대학생"
var height = 171.5

print(type(of: height))

age = 99
job = "writer"
print("저의 이름은 \(name)이고 저의 나이는 \(age)입니다. 그리고 직업은 \(job)이고 키는 \(height) 센티미터입니다.")

var integer: Int = -60
let unsignedInteger: UInt = 50
print("integer 값: \(integer), unsignedInteger 값: \(unsignedInteger)")
print("Int 최대값: \(Int.max), Int 최솟값: \(Int.min)")
print("UInt 최대값: \(UInt.max), UInt 최솟값: \(UInt.min)")
let largeInteger: Int64 = Int64.max
let smallUnsignedInteger: UInt8 = UInt8.max
print("Int64 최댓값: \(largeInteger), UInt8 최댓값: \(smallUnsignedInteger)")

//let tooLarge: Int = Int.max + 1
//let cannotBeNegative: UInt = -5

//integer = unsignedInteger
integer = Int(unsignedInteger)

let decimalInteger: Int = 10
let binaryInteger: Int = 0b1010
let octalInteger: Int = 0o12
let hexadecimalInteger: Int = 0xB

var boolean: Bool = true
boolean.toggle()
print("boolean 값: \(boolean)")

let iLoveYou: Bool = true
let isTimeUnlimeted: Bool = false
print("시간은 무한합니까?: \(isTimeUnlimeted)")

var floatValue: Float = 1234567890.1

let doubleValue: Double = 1234567890.1

print("floatValue: \(floatValue)", "doubleValue: \(doubleValue)")

print(Int.random(in: 1...100))
print(UInt.random(in: 10...80))

print(Float.random(in: 9.5...10.5))
print(Double.random(in: 10.5...11.5))

let alphabetA: Character = "A"
print(alphabetA)

let commandCharacter: Character = "🥸"
print(commandCharacter)

let 한글변수이름: Character = "ㄱ"
print("한글의 첫 자음: \(한글변수이름)")

//한글변수이름 = "ㄴ"

let name2: String = "yagom"

var introduce: String = String()

introduce.append("제 이름은")
print(introduce)

introduce = introduce + " " + name2 + "입니다."
print(introduce)

print("name2의 글자 수: \(name2.count)")
print("introduce가 비어있습니까?: \(introduce.isEmpty)")

let unicodeScalarValue: Character = "\u{2665}"
print(unicodeScalarValue)

let hello: String = "Hello"
let name3: String = "moon"
var greeting: String = hello + " " + name3 + "님"
print(greeting)

greeting = hello
greeting += " "
greeting += name3
greeting += "님"
print(greeting)

var isSameString: Bool = false

isSameString = hello == "안녕하세요!"
print(isSameString)

isSameString = hello == "안녕하세용!"
print(isSameString)

isSameString = name3 == "문인성"
print(isSameString)

isSameString = name3 == greeting
print(isSameString)

var hasPrefix: Bool = false
hasPrefix = hello.hasPrefix("He")
print(hasPrefix)

hasPrefix = hello.hasPrefix("HE")
print(hasPrefix)

hasPrefix = greeting.hasPrefix("Hello ")
print(hasPrefix)

hasPrefix = name3.hasPrefix("oon")
print(hasPrefix)

hasPrefix = hello.hasPrefix("Hello")
print(hasPrefix)

var hasSuffix: Bool = false
hasSuffix = hello.hasSuffix("He")
print(hasSuffix)

hasSuffix = hello.hasSuffix("llo")
print(hasSuffix)

hasSuffix = greeting.hasSuffix("moon")
print(hasSuffix)

hasSuffix = greeting.hasSuffix("moon님")
print(hasSuffix)

hasSuffix = name3.hasSuffix("on")
print(hasSuffix)

var convertedString: String = ""

convertedString = hello.uppercased()
print(convertedString)
print(hello)

convertedString = hello.lowercased()
print(convertedString)
print(hello)

convertedString = greeting.uppercased()
print(convertedString)
print(greeting)

convertedString = greeting.lowercased()
print(convertedString)
print(greeting)

var isEmptyString: Bool = false
isEmptyString = greeting.isEmpty
print(isEmptyString)

greeting = "안녕"
isEmptyString = greeting.isEmpty
print(isEmptyString)

greeting = ""
isEmptyString = greeting.isEmpty
print(isEmptyString)

greeting = " "
isEmptyString = greeting.isEmpty
print(isEmptyString)

print(greeting.count)

greeting = "안녕하세요"
print(greeting.count)

greeting = "안녕!"
print(greeting.count)

greeting = "hello world!"
print(greeting.count)

greeting = """
안녕하세요 저는 문인성입니다.
스위프트 잘하고 싶어요!
잘 부탁합니다!
"""
print(greeting)

print("문자열 내부에\n 이런 \"특수문자\"를 \t사용하면 \\이런 놀러운 결과를 볼 수 있습니다")
print(#"문자열 내부에서 특수문자를 사용하기 싫다면 문자열 앞, 뒤에 #을 붙여주\n세요"#)
let number: Int = 100
print(#"특수문자를 사용하지 않을 때도 문자열 보간법을 사용하고 싶다면 이렇게 \(number) 해보세요"#)
print("특수문자를 사용하지 않을 때도 문자열 보간법을 사용하고 싶다면 이렇게 \(number) 해보세요")
print(#"특수문자를 사용하지 않을 때도 문자열 보간법을 사용하고 싶다면 이렇게 \#(number) 해보세요"#)

var someVar: Any = "moon"
print(someVar)
someVar = 50
print(someVar)
someVar = 100.1
print(someVar)

