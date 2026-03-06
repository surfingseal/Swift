import UIKit

var greeting = "Hello, playground"

func hello(name: String) -> String {
    return "Hello \(name)!"
}

let helloJenny: String = hello(name: "Jenny")
print(helloJenny)

func introduce(name: String) -> String {
    "제 이름은 " + name + "입니다"
}

let introduceJenny: String = introduce(name: "Jenny")
print(introduceJenny)

func helloWorld() -> String {
    return "Hello, World!"
}

print(helloWorld())

func sayHello(`var`: String, yourName: String) -> String {
    return "Hello \(yourName)! I'm \(`var`)"
}

print(sayHello(var: "Moon", yourName: "Shin"))

func sayHello(from Myname: String, to name: String) -> String {
    return "Hello \(name)! I'm \(Myname)"
}

print(sayHello(from: "Moon", to: "Shin"))

func sayHello(_ name: String, _ times: Int) -> String {
    var result: String = ""
    
    for _ in 0 ..< times {
        result += "Hello \(name)!" + " "
    }
    
    return result
}

print(sayHello("Moon", 2))

func sayHello(to name: String, _ times: Int) -> String {
    var result: String = ""
    
    for _ in 0 ..< times {
        result += "Hello \(name)!" + " "
    }
    
    return result
}

func sayHello(to name: String, repeatCount times: Int) -> String {
    var result: String = ""
    
    for _ in 0 ..< times {
        result += "Hello \(name)!" + " "
    }
    
    return result
}

print(sayHello(to: "Chope", 2))
print(sayHello(to: "Moon", repeatCount: 2))

func sayHello(_ name: String, times: Int = 3) -> String {
    var result: String = ""
    
    for _ in 0 ..< times {
        result += "Hello \(name)!" + " "
    }
    
    return result
}

print(sayHello("Hana"))

print(sayHello("Joe", times: 2))

func sayHelloToFriends(friends names: String..., me: String) -> String {
    var result: String = ""
    
    for friend in names {
        result += "Hello \(friend)!" + " "
    }

    result += "I'm " + me + "!"
    
    return result
}


print(type(of: sayHelloToFriends))

print(sayHelloToFriends(friends: "Moon", "Shin", "Shim", me: "Moon"))
print(sayHelloToFriends(me: "Moon"))

func exam(_ int: Int, _ times: Int) {
    for _ in 0 ..< times {
        print(int)
    }
}

var numbers: [Int] = [1, 2, 3]

func nonReferenceParameter(_ arr: [Int]) {
    var copiedArr: [Int] = arr
    copiedArr[1] = 1
}

func referenceParameter(_ arr: inout [Int]) {
    arr[1] = 1
}

nonReferenceParameter(numbers)
print(numbers[1])

referenceParameter(&numbers)
print(numbers[1])

actor ValueManager {
    var storedValue: Int = 0
    
    func isLessThan(lhs: Int, rhs: Int) -> Bool {
        if lhs < storedValue {
            storedValue = lhs
        } else if rhs < storedValue {
            storedValue = rhs
        }
        return lhs < rhs
    }
}

var global: Int = 0
var someLocal: Int = 10

//func store(value: consuming Int) {
//    global = value
//}
//
//store(value: someLocal)
//
//func storeAndPrint(value: consuming Int) {
//    global = value
//    print(value)
//}
//
//func copyAndPrint(value: consuming Int) {
//    global = copy value
//    print(value)
//}

func sayHelloWorld() {
    print("Hello world")
}
sayHelloWorld()

func sayHello2(from myName: String, to name: String) {
    print("Hello \(name)! I'm \(myName)")
}
sayHello2(from: "Moon", to: "Minjeong")

func sayGoodbye() -> Void {
    print("Good bye")
}
sayGoodbye()

typealias CalculateTwoInts = (Int, Int) -> Int

func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

var mathFunction: CalculateTwoInts = addTwoInts
print(mathFunction(2, 5))

mathFunction = multiplyTwoInts
print(mathFunction(2, 5))

func printMathResult(_ mathFunction: CalculateTwoInts, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}

printMathResult(addTwoInts, 3, 5)

func chooseMathFunction(_ toAdd: Bool) -> CalculateTwoInts {
    return toAdd ? addTwoInts as CalculateTwoInts : multiplyTwoInts as CalculateTwoInts
}

typealias MoveFunc = (Int) -> Int

//func goRight(_ currentPosition: Int) -> Int {
//    return currentPosition + 1
//}
//
//func goLeft(_ currentPosition: Int) -> Int {
//    return currentPosition - 1
//}
//
//func functionForMove(_ shouldGoLeft: Bool) -> MoveFunc {
//    return shouldGoLeft ? (goLeft as MoveFunc): (goRight as MoveFunc)
//}
//
//var position: Int = 3
//
//let moveToZero: MoveFunc = functionForMove(position > 0)
//print("원점으로 갑시다.")

func functionForMove(_ shouldGoLeft: Bool) -> MoveFunc {
    func goRight(_ currentPosition: Int) -> Int {
        return currentPosition + 1
    }
    
    func goLeft(_ currentPosition: Int) -> Int {
        return currentPosition - 1
    }
    
    return shouldGoLeft ? goLeft : goRight
}

var position: Int = -4

let moveToZero: MoveFunc = functionForMove(position > 0)

while position != 0 {
    print("\(position)... ")
    position = moveToZero(position)
}

print("원점 도착")

func crashAndBurn() -> Never {
    fatalError("Something very, very bad happened")
}

//crashAndBurn()

func someFunction(isAllIsWell: Bool) {
    guard isAllIsWell else {
        print("마을에 도둑이 들었습니다!")
        crashAndBurn()
    }
    print("All is well")
}

someFunction(isAllIsWell: true)
//someFunction(isAllIsWell: false)

func say(_ something: String) -> String {
    print(something)
    return something
}

@discardableResult func discadableResultSay(_ something: String) -> String {
    print(something)
    return something
}

say("hello")

discadableResultSay("hello")
