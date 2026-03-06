import UIKit

prefix operator **

//prefix func ** (value: Int) -> Int {
//    return value * value
//}
//
//let minusFive: Int = -5
//let sqrtMinusFive: Int = **minusFive
//
//print(sqrtMinusFive)

prefix func ** <T: BinaryInteger> (value: T) -> T {
    return value * value
}

let minusFive: Int = -5
let five: UInt = 5

let sqrtMinusFive: Int = **minusFive
let sqrtFive: UInt = **five

print(sqrtMinusFive)
print(sqrtFive)

//func swapTwoInts(_ a: inout Int, _ b: inout Int) {
//    let temporaryA: Int = a
//    a = b
//    b = temporaryA
//}

var numberOne: Int = 5
var numberTwo: Int = 10

//swapTwoInts(&numberOne, &numberTwo)
//print("\(numberOne), \(numberTwo)")

//func swapTwoStrings(_ a: inout String, _ b: inout String) {
//    let temporaryA: String = a
//    a = b
//    b = temporaryA
//}

var stringOne: String = "A"
var stringTwo: String = "B"

//swapTwoStrings(&stringOne, &stringTwo)
//print("\(stringOne), \(stringTwo)")

//func swapTwoValues(_ a: inout Any, _ b: inout Any) {
//    let temporaryA: Any = a
//    a = b
//    b = temporaryA
//}

var anyOne: Any = 1
var anyTwo: Any = "Two"

//swapTwoValues(&anyOne, &anyTwo)
//print("\(anyOne), \(anyTwo)")
//
//anyOne = stringOne
//anyTwo = stringTwo
//
//swapTwoValues(&anyOne, &anyTwo)
//print("\(anyOne), \(anyTwo)")
//print("\(stringOne), \(stringTwo)")

//swapTwoValues(&stringOne, &stringTwo)

func swapTwoValues<T> (_ a: inout T, _ b: inout T) {
    let temporaryA: T = a
    a = b
    b = temporaryA
}

swapTwoValues(&numberOne, &numberTwo)
print("\(numberOne), \(numberTwo)")

swapTwoValues(&stringOne, &stringTwo)
print("\(stringOne), \(stringTwo)")

swapTwoValues(&anyOne, &anyTwo)
print("\(anyOne), \(anyTwo)")

//swapTwoValues(&numberOne, &stringOne)

//struct IntStack {
//    var items = [Int]()
//    mutating func push(_ item: Int) {
//        items.append(item)
//    }
//    mutating func pop() -> Int {
//        return items.removeLast()
//    }
//}
//
//var integerStack: IntStack = IntStack()
//
//integerStack.push(3)
//print(integerStack.items)
//
//integerStack.push(2)
//print(integerStack.items)
//
//integerStack.push(3)
//print(integerStack.items)
//
//integerStack.push(5)
//print(integerStack.items)
//
//integerStack.pop()
//print(integerStack.items)
//
//integerStack.pop()
//print(integerStack.items)
//
//integerStack.pop()
//print(integerStack.items)
//
//integerStack.pop()
//print(integerStack.items)

//struct Stack<Element> {
//    var items = [Element]()
//    mutating func push(_ item: Element) {
//        items.append(item)
//    }
//    mutating func pop() -> Element {
//        return items.removeLast()
//    }
//}
//
//var doubleStack: Stack<Double> = Stack<Double>()
//
//doubleStack.push(1.0)
//print(doubleStack.items)
//
//doubleStack.push(2.0)
//print(doubleStack.items)
//
//doubleStack.pop()
//print(doubleStack.items)
//
//var stringStack: Stack<String> = Stack<String>()
//
//stringStack.push("1")
//print(stringStack.items)
//
//stringStack.push("2")
//print(stringStack.items)
//
//stringStack.pop()
//print(stringStack.items)
//
//var anyStack: Stack<Any> = Stack<Any>()
//
//anyStack.push(1.0)
//print(anyStack.items)
//
//anyStack.push("2")
//print(anyStack.items)
//
//anyStack.push(3)
//print(anyStack.items)
//
//anyStack.pop()
//print(anyStack.items)
//
//extension Stack {
//    var topElement: Element? {
//        return self.items.last
//    }
//}

//print(doubleStack.topElement)
//print(stringStack.topElement)
//print(anyStack.topElement)

//func swapTwoValues<T: BinaryInteger> (_ a: inout T, _ b: inout T) {
//    let temporaryA: T = a
//    a = b
//    b = temporaryA
//}

//struct Stack<Element: Hashable> {
//    var items = [Element]()
//    mutating func push(_ item: Element) {
//        items.append(item)
//    }
//    mutating func pop() -> Element {
//        return items.removeLast()
//    }
//}

//func swapTwoValues<T: BinaryInteger>(_ a: inout T, _ b: inout T) where T: FloatingPoint {
//
//}

//func subtractTwoValue<T>(_ a: T, _ b: T) -> T {
//    return a - b
//}

func subtractTwoValue<T: BinaryInteger>(_ a: T, _ b: T) -> T {
    return a - b
}

func makeDictionaryWithTwoValue<Key: Hashable, Value>(key: Key, value: Value) -> Dictionary<Key, Value> {
    let dictionary: Dictionary<Key, Value> = [key:value]
    return dictionary
}

protocol Container {
    associatedtype ItemType
    var count: Int { get }
    mutating func append(_ item: ItemType)
    subscript(i: Int) -> ItemType { get }
}

class MyContainer: Container {
    var items: Array<Int> = Array<Int>()
    
    var count: Int {
        return items.count
    }
    
    func append(_ item: Int) {
        items.append(item)
    }
    
    subscript(i: Int) -> Int {
        return items[i]
    }
}

//struct IntStack: Container {
//    var items = [Int]()
//    mutating func push(_ item: Int) {
//        items.append(item)
//    }
//    
//    mutating func pop() -> Int {
//        return items.removeLast()
//    }
//    
//    mutating func append(_ item: Int) {
//        self.push(item)
//    }
//    
//    var count: Int {
//        return items.count
//    }
//    subscript(i: Int) -> Int {
//        return items[i]
//    }
//}

struct IntStack: Container {
    typealias ItemType = Int
    
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    
    mutating func pop() -> Int {
        return items.removeLast()
    }
    
    mutating func append(_ item: Int) {
        self.push(item)
    }
    
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}

struct Stack<Element>: Container {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    
    mutating func append(_ item: Element) {
        self.push(item)
    }
    
    var count: Int {
        return items.count
    }
    
    subscript(i: Int) -> Element {
        return items[i]
    }
}

extension Stack {
    subscript<Indices: Sequence>(indices: Indices) -> [Element]
    where Indices.Iterator.Element == Int {
        var result = [ItemType]()
        for index in indices {
            result.append(self[index])
        }
        return result
    }
}

var integerStack: Stack<Int> = Stack<Int>()
integerStack.append(1)
integerStack.append(2)
integerStack.append(3)
integerStack.append(4)
integerStack.append(5)

print(integerStack[0...2])

protocol GameCharacter {
    var name: String { get }
}

protocol Weapon {
    var name: String { get }
}

class Warrior: GameCharacter {
    var name: String = "Warrior"
}

class Wizard: GameCharacter {
    var name: String = "Wizard"
}

struct Sword: Weapon {
    var name: String = "Sword"
}

struct Bow: Weapon {
    var name: String = "Bow"
}

struct Wand: Weapon {
    var name: String = "Wand"
}

let dave: Warrior = .init()
let john: Wizard = .init()
let sword: Sword = .init()
let bow: Bow = .init()
let wand: Wand = .init()

func pairWeapon(characters: any GameCharacter..., weapons: any Weapon...) -> [(any GameCharacter, any Weapon)] {
    var result: [(any GameCharacter, any Weapon)] = []
    
    for (index, weapon) in weapons.enumerated() {
        result.append((characters[index], weapon))
    }
    
    return result
}

//let pairResult1: [(any GameCharacter, any Weapon)] = pairWeapon(characters: dave, john, weapons: sword, bow, wand)

//func pairWeapon2<T: GameCharacter, U: Weapon> (characters: T..., weapons: U...) -> [(T, U)] {
//    var result: [(T, U)]
//    
//    for (index, weapon) in weapons.enumerated() {
//        result.append((characters[index], weapon))
//    }
//    
//    return result
//}

//let pairResult2 = pairWeapon2(character: dave, john, weapons: sword, bow, wand)

func pairWeapon3<each T: GameCharacter, each U: Weapon>(characters: repeat each T, weapons: repeat each U) -> (repeat (each T, each U)) {
    for(character, weapon) in repeat (each characters, each weapons) {
        print("\(character.name) - \(weapon.name)")
    }
    
    return (repeat (each characters, each weapons))
}

let pairResult3 = pairWeapon(characters: dave, john, weapons: sword, bow)


