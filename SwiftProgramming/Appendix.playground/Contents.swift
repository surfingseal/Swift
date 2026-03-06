import UIKit
import Foundation
import Swift

let aSet: Set<Int> = [1, 2, 3]

//@available(tvOS, unavailable)
//class SomeClass {}

//class SomeClass {
//    @available(swift, introduced: 4.0)
//    var multilineString: String {
//        return """
//            여러 줄
//            문자열은
//            스위프트 4.0 이상에서 
//            사용할 수 있습니다.
//            """
//    }
//}
//
//@available(*, deprecated: 2.0.0)
//class SomeClass {}

//@available(*, obsoleted: 2.0.0)
//class SomeClass {}
//
//@available(*, deprecated: 2.0.0, message: "아마도 쓰지 않는 것이 좋을 걸?")
//class SomeClass {}

//let instance = SomeClass()

//@available(*, deprecated: 2.0.0, message: "아마도 쓰지 않는 것이 좋을 걸?", renamed: "NewClass")
//class SomeClass {}
//
//@available(*, unavailable, message: "사용 불가", renamed: "NewClass")
//class AnotherClass {}
//
//@available(*, introduced: 2.0.0)
//class NewClass {}
//
//let someInstance = SomeClass()
//let anotherInstance = AnotherClass()
//let newInstance = NewClass()

@available(iOS 11.0, *)
func someFunction() {}

@available(iOS 11.0, macOS 10.13, watchOS 4.0, *)
func anotherFunction() {}

//@objc
//class SomeClass {}

class AnotherClass: NSObject {}

protocol parentProtocol {}

//@objc
//protocol SomeProtocol: ParentProtocol { }

@objc
enum Planet: Int {
    case mercury, venus, earth, mars, jupiter
}

@objc(Example)

class ExampleClass: NSObject {
    @objc var enabled: Bool {
        @objc(isEnabled) get {
            return true
        }
    }
    
    @objc(printWithName:)
    func print(name: String) {}

    @objc(initWithName:)
    init(name: String) {}
}

//@dynamicMemberLookup
//struct Contacts {
//    private let contacts: [String: String] = ["yagom": "010-1234-4567",
//                                              "hana": "010-5544-5568"]
//    subscript(dynamicMember member: String) -> String {
//        return contacts[member] ?? "114"
//    }
//}
//
//let contacts: Contacts = Contacts()
//
//let hanas: String = contacts.hana
//print(hanas)
//
//let yagoms: String = contacts[dynamicMember: "yagom"]
//print(yagoms)
//
//let somebody: String = contacts.somebody
//print(somebody)
//
//let anybody: String = contacts[dynamicMember: "anybody"]
//print(anybody)

//@dynamicCallable
//struct Contacts {
//    private let contacts: [String: String] = ["yagom": "010-1234-4567",
//                                              "hana": "010-5544-5568"]
//    
//    func dynamicallyCall(withArguments names: [String]) -> [String] {
//        var result: [String] = []
//        for name in names {
//            guard let mobile: String = contacts[name] else {
//                continue
//            }
//            return result
//        }
//    }
//}
//
//let contacts: Contacts = Contacts()
//var mobiles: [String]
//
//mobiles = contacts("yagom", "hana")
//print(mobiles)
//mobiles = contacts("you", "yagom", "me")
//print(mobiles)
//
//@dynamicCallable
//struct Repeater {
//    func dynamicallyCall(withKeywordArguments pairs: keyValuePairs<String, Int>) -> String {
//        return pairs
//            .map { label, count in
//                repeatElement(label, count: count).joined(separator: " ")
//            }
//            .joined(separator: "\n")
//    }
//}
//
//let repeatLabels: Repeater = Repeater()
//print(repeatLabels(yagom: 1, hana: 2))

//@propertyWrapper
//struct TextFileIO {
//    private var fileLocation: URLRequest
//    
//    init(fileName: String?) {
//        let applicationSupportDirectory: URL
//        
//        do {
//            applicationSupportDirectory = try FileManager.default.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
//        } catch {
//            fatalError("파일경로 생성 실패")
//        }
//        
//        let fileNameToAppend: String
//        
//        if let fileName = fileName {
//            fileNameToAppend = fileName
//        } else {
//            fileNameToAppend = "file.text"
//        }
//        
//        self.fileLocation = applicationSupportDirectory.appendingPathComponent(fileNameToAppend)
//    }
//    
//    var wrappedValue: String {
//        get {
//            guard let string = try? String(contentsOf: self.fileLocation, encoding: String.Encoding.utf8) else {
//                return ""
//            }
//            return string
//        }
//        
//        set {
//            try? newValue.write(to: self.fileLocation, atomically: true, encoding: String.Encoding.utf8)
//        }
//    }
//}
//
//struct NoteManager {
//    @TextFileIO(fileName: "title.txt")
//    var title: String
//    
//    @TextfileIO(fileName: "contents.txt")
//    var contents: String
//}
//
//var manager = NoteManager()
//print(manager.title)
//manager.title = "title"
//
//print(manager.contents)
//manager.contents = "yagom"
//
//@propertyWrapper
//struct LimitedRange<T: Comparable> {
//    var value: T
//    let range: ClosedRange<T>
//    
//    init(wrappedValue: T, range: ClosedRange<T>) {
//        precondition(range.contains(wrappedValue))
//        self.value = wrappedValue
//        self.range = range
//    }
//    
//    var wrappedValue: T {
//        get {
//            return self.value
//        }
//        mutating set {
//            value = max(min(range.upperBound, newValue), range.lowerBound)
//        }
//    }
//}
//
//struct Person {
//    let name: String
//    @LimitedRange(range: 0...150) var age: Int = 0
//}
//
//var yagom: Person = Person(name: "yagom", age: 100)
//print(yagom.age)
//yagom.age = -1
//print(yagom.age)
//yagom.age = 160
//print(yagom.age)

//@main
//struct MyTopLevel {
//    static func main() {
//
//    }
//}

@backDeployed(before: macOS 13)
public func canUseInAllVersion() {}

@available(iOS 15, *)
@backDeployed(before: iOS 17)
public func canUseFrom15() {}

// var someGlobalInstance: NSObject = NSObject()

func swiftParamFunction(_ param: @convention(block) () -> Void) { param() }

func cParamFunction(_ param: @convention(c) () -> Void) { param() }

//swiftParamFunction{ [someGlobalInstance] in print(someGlobalInstance) }
//blockParamFunction{ [someGlobalInstance] in print(someGlobalInstance) }

//cParamFunction{ [someGlobalInstance] in print(someGlobalInstance) }
//
//let someSwiftClosure: @convention(swift) () -> Void = {
//    [someGlobalInstance] in print(someGlobalInstance)
//}
//
//let someBlock: @convention(block) () -> Void = {
//    [someGlobalInstance] in print(someGlobalInstance)
//}
//
//let someCFunction: @convention(c) () -> Void = {
//    [someGlobalInstance] in print(someGlobalInstance)
//}

//struct Person: Codable {
//    enum Gender: String, Codable {
//        case male, female, unknown
//    }
//    
//    var name: String
//    var age: Int
//    var gender: Gender
//    var friends: [Person]
//}
//
//let yagom = Person(name: "yagom", age: 20, gender: .male, friends: [])
//let hana = Person(name: "hana", age: 22, gender: .female, friends: [yagom])
//let eric = Person(name: "eric", age: 25, gender: .male, friends: [yagom, hana])
//
//var encoder = JSONEncoder()
//
//let jsonData = try encoder.encode(eric)
//let jsonString = String(data: jsonData, encoding: .utf8)
//print(jsonString ?? "convert to json string failed")
//
//let decoder = JSONDecoder()
//let decoded: Person = try decoder.decode(Person.self, from: jsonData)
//print(decoded.name)
//
//struct Car: Codable {
//    let wheelCount: Int
//    let doorCount: Int
//}
//
//var snakeJsonString = "[{\"wheel_count\":4, \"door_count\":4}, {\"wheel_count\": 6, \"door_count\": 2]"
//var snakeJsonData = snakeJsonString.data(using: String.Encoding.utf8)!
//
//let snakeDecoder = JSONDecoder()
//snakeDecoder.keyDecodingStrategy = JSONDecoder.KeyDecodingStrategy.convertFromSnakeCase
//
//let cars = try snakeDecoder.decode([Car].self, from: snakeJsonData)
//print(cars.count)
//
//let snakeEncoder = JSONEncoder()
//
//let nonSnakeJsonData = try snakeEncoder.encode(cars)
//let nonSnakeJsonString = String(data: nonSnakeJsonData, encoding: .utf8)
//print(nonSnakeJsonString ?? "convert to json string failed")
//
//struct Animal: Codable {
//    var species: String
//    var age: Int
//    var birth: Date
//    
//    enum CodingKeys: String, CodingKey {
//        case species
//        case age
//        case birth = "date_of_birth"
//    }
//}
//
//var puppyString = "{\"species\":\"Dog\",\"age\":1,\"date_of_birth\":596300800}"
//var puppyData = puppyString.data(using: String.Encoding.utf8)!
//let puppyDecoder = JSONDecoder()
//
//let puppy = try puppyDecoder.decode(Animal.self, from: puppyData)
//print(puppy.birth)
//
//enum Day: String, CaseIterable {
//    case mon = "월", tue = "화", wed = "수", thu = "목", fri = "금"
//    case sat = "토", sun = "일"
//}
//
//for day in Day.allCases {
//    print(day, terminator: " ")
//}
//
//if let dayOfClean = Day.allCases.randomElement() {
//    print("\n청소하는 날 : \(dayOfClean.rawValue)")
//}
//
//enum ConverError: Error {
//    case notAnASCII
//    case unknown
//}
//
//func ascii(_ character: Character) -> Result<UInt8, ConverError> {
//    if let ascii = character.asciiValue {
//        return Result.success(ascii)
//    } else {
//        return Result.failure(ConverError.notAnASCII)
//    }
//}
//
//switch ascii("A") {
//case .success(let value):
//    print(value)
//case .failure(let error):
//    print(error)
//}
//
//switch ascii("ㄱ") {
//case .success(let value):
//    print(value)
//case .failure(let error):
//    print(error)
//}
//
//print(ascii("A"))
//print(ascii("ㄱ"))

//abs(-100)
//abs(100)
//
//let int8: Int8 = 5
//let int64: Int64 = numericCast(int8)
//
//let zeroes = repeatElement(0, count: 5)
//for x in zeroes {
//    print(x)
//}
//
//var valueA: Int = 10
//var valueB: Int = 10

//assert(valueA == valueB, "valueA != valueB")
// assertionFailure("just assertion failure")
// fatal error: just assertion


//debugPrint(valueA, valueB, separator: ",", terminator: "")
//debugPrint(valueA, valueB)
//
//dump(valueA)

//fatalError()

//max(1, 3)
//max(1, 2, 3, 4, 5, 6, 7, 8)
//min(1, 3)
//min(1, 2, 3, 4, 5, 6, 7, 8)
//
//precondition(valueA == valueB, "value != valueB")
// preconditionFailure("valueA != valueB")

//print(valueA, valueB, separator: ",", terminator: "")
//print(valueA, valueB)
//
//valueA = 100
//valueB = 200
//
//swap(&valueA, &valueB)
//print(valueA, valueB)
//
//let words = ["하나", "둘", "셋", "넷"]
//let numbers = 1...4
//
//for(word, number) in zip(words, numbers) {
//    print("\(word): \(number)")
//}
//
//let naturalNumbers = 1...Int.max
//print(zipped)

//class `let` {}
//let `self`: `let` = `let`()
//func `var`(param: `let`) {}
//`var`(param: `self`)
//
//func printDebugInfo() {
//    print("\(#file) 파일의 \(#line)번 줄, \(#column)번 칸이고, \(#function) 함수 안에서 실행되고 있습니다.")
//}
//
//printDebugInfo()

#if os(Linux)
    print("이 프로그램은 리눅스 환경을 위해 컴파일했습니다. ")
#elseif os(macOS)
    print("이 프로그램은 iOS 환경을 위해 컴파일했습니다. ")
#else
    print("이 프로그램은 Windows 환경을 위해 컴파일했습니다. ")
#endif

#if DEBUG
    print("DEBUG 환경으로 컴파일했습니다. ")
#elseif TEST_RELEASE
    print("TEST RELEASE 환경으로 컴파일했습니다. ")
#endif

#if compiler(>=5.0)
    print("스위프트 5.0 이상의 컴파일러에서 컴파일했습니다.")
#endif
#if swift(>=4.2)
    print("스위프트 4.2 이상의 버전에서 컴파일했습니다.")
#endif
#if compiler(>=5.0) && swift(<5.0)
    print("스위프트 5.0 이상의 컴파일러에서 스위프트 5.0 미만의 버전으로 컴파일했습니다.")
#endif

#if canImport(UIkit)
    print("UIKit을 사용할 수 있습니다")
#elseif canImport(Appkit)
    print("APPKit을 사용할 수 있습니다.")
#else
    print("UIKit과 APPKit을 사용할 수 없습니다.")
#endif

#if targetEnvironment(simulator)
    print("시뮬레이터 환경으로 컴파일했습니다.")
#endif

var i: Int = 0
#if swift(>=2.2)
    i += 1
#else
    i++
#endif

print(i)

#if compiler(<2.2)
    i++
#else
    i += 1
#endif

print(i)

print("\(#file) 파일의 \(#line)번 줄에서 실행되고 있습니다.")

#sourceLocation(file: "mine.swift", line: 100)
func printDebugInfo() {
    print("\(#file) 파일의 \(#line)번 줄, \(#column)번 칸이고, \(#function) 함수 안에서 실행되고 있습니다.")
}

printDebugInfo()

#sourceLocation()

print("\(#file) 파일의 \(#line)번 줄에서 실행되고 있습니다.")

#warning("여기에 작성할 코드가 있을 텐데요! 혹시 잊은 것이 없는지 확인해보세요!")
//#error("여기에 코드 작성 안하면 오류가 발생해요!")

if #available(iOS 11, *) {
    print("iOS 11 이상의 버전에서 실행 중입니다.")
} else if #available(iOS 10, *) {
    print("iOS 10 이상의 버전에서 실행 중입니다.")
} else {
    print("iOS 10 미만의 버전에서 실행 중입니다.")
}

if #available(iOS 11.0, macOS 10.13, *) {
    print("iOS 11.0 이상 또는 macOS의 10.13 이상의 버전에서 실행 중입니다.")
} else if #available(watchOS 4.0, *) {
    print("watchOS 4.0 이상의 버전에서 실행 중입니다.")
} else {
    print("그 외 기타 플랫폼")
}

while true {
    guard #available(iOS 9.0, *) else {
        print("iOS 9.0 미만의 버전입니다.")
        break
    }
}
