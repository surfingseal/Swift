import UIKit

let names: [String] = ["wizplan", "eric", "yagom", "jenny"]

func backwards(first: String, second: String) -> Bool {
    print("\(first) \(second) 비교중")
    return first > second
}

//let reversed: [String] = names.sorted(by: backwards)
//print(reversed)

//let reversed: [String] = names.sorted(by: { (first: String, second: String) -> Bool in
//    return first > second
//})
//
//print(reversed)

//let reversed: [String] = names.sorted() { (first: String, second: String) -> Bool in
//    return first > second
//}
//
//let reversed: [String] = names.sorted { (first: String, second: String) -> Bool in
//    return first > second
//}

//let reversed: [String] = names.sorted { (first, second) in
//    return first > second
//}

//let reversed: [String] = names.sorted { $0 > $1 }

let reversed: [String] = names.sorted(by: >)

func saveToDB(text: String?, onSuccess: () -> Void, onFailure: () -> Void) {
    if let text {
        onSuccess()
    } else {
        onFailure()
    }
}

saveToDB(text: "텍스트") {
    print("저장 완료!")
} onFailure: {
    print("저장 실패")
}

func makeIncrementer(forIncrement amount: Int) -> (() -> Int) {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTwo: () -> Int = makeIncrementer(forIncrement: 2)

//let incrementByTwo: (() -> Int) = makeIncrementer(forIncrement: 2)
let incrementByTwo2: (() -> Int) = makeIncrementer(forIncrement: 2)
let incrementByTen: (() -> Int) = makeIncrementer(forIncrement: 10)

// let first: Int = incrementByTwo()
// let second: Int = incrementByTwo()
// let third: Int = incrementByTwo()

// let first2: Int = incrementByTwo()
// let second2: Int = incrementByTwo()
// let third2: Int = incrementByTwo()

// let ten: Int = incrementByTen()
// let twenty: Int = incrementByTen()
// let thirty: Int = incrementByTen()

let sameWithIncrementByTwo: (() -> Int)  = incrementByTwo

// let first: Int = incrementByTwo()
// let second: Int = sameWithIncrementByTwo

var completionHandlers: [() -> Void] = []

@MainActor
func someFunctionWithExcapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

typealias VoidVoidClosure = () -> Void
let firstClosure: VoidVoidClosure = {
    print("Closure A")
}

let secondClosure: VoidVoidClosure = {
    print("Closure B")
}

func returnOneClosure(first: @escaping VoidVoidClosure, second: @escaping VoidVoidClosure, shouldReturnFirstClosure: Bool) -> VoidVoidClosure {
    return shouldReturnFirstClosure ? first: second
}

//let returnedClosure: VoidVoidClosure = returnOneClosure(first: firstClosure, second: secondClosure, shouldReturnFirstClosure: true)
//
//returnedClosure()

var closures: [VoidVoidClosure] = []

@MainActor
func appendClosure(closure: @escaping VoidVoidClosure) {
    closures.append(closure)
}

func functionWithNoescapeClosure(closure: VoidVoidClosure) {
    closure()
}

func functionWithEscapingClosure(completionHandler: @escaping VoidVoidClosure) -> VoidVoidClosure {
    return completionHandler
}

class SomeClass {
    var x = 10
    
    func runNoescapeClosure() {
        functionWithNoescapeClosure { x = 200 }
    }
    
    func runEscapingClosure() -> VoidVoidClosure {
        return functionWithEscapingClosure { self.x = 100 }
    }
}

let instance: SomeClass = SomeClass()
instance.runNoescapeClosure()
print(instance.x)

let returnedClosure: VoidVoidClosure = instance.runEscapingClosure()
returnedClosure()
print(instance.x)

//func hasElements(in array: [Int], match predicate: (Int) -> Bool) -> Bool {
//    return (array.lazy.filter { predicate($0)}).isEmpty == false
//}

let numbers: [Int] = [2, 4, 6, 8]

let evenNumberPredicate = { (number: Int) -> Bool in
    return number % 2 == 0
}

let oddNumberPredicate = { (number: Int) -> Bool in
    return number % 2 == 1
}

func hasElements(in array: [Int], match predicate: (Int) -> Bool) -> Bool {
    return withoutActuallyEscaping(predicate, do: { escapablePredicate in
        return (array.lazy.filter { escapablePredicate($0) }.isEmpty == false)
    })
}

let hasEvenNumber = hasElements(in: numbers, match: evenNumberPredicate)
let hasOddNumber = hasElements(in: numbers, match: oddNumberPredicate)

print(hasEvenNumber)
print(hasOddNumber)

//var customersInLine: [String] = ["yoangWha", "Sangyong", "SungHun", "HaMi"]
//print(customersInLine.count)
//
//let customerProvider: () -> String = {
//    return customersInLine.removeFirst()
//}
//print(customersInLine.count)
//
//print("Now serving \(customerProvider())!")
//print(customersInLine.count)
//
//func serveCustomer(_ customerProvider: @autoclosure () -> String) {
//    print("Now serving \(customerProvider())!")
//}
//
//serveCustomer(customersInLine.removeFirst())

var customersInLine: [String] = ["minjae", "innoceive", "sopress"]

func returnProvider(_ customerProvider: @autoclosure @escaping () -> String) -> (() -> String) {
    return customerProvider
}

let customerProvider: () -> String = returnProvider(customersInLine.removeFirst())
print("Now serving \(customerProvider())!")
print("Now serving \(customerProvider())!")
print("Now serving \(customerProvider())!")

