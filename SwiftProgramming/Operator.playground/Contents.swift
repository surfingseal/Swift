import UIKit

//let number: Double = 5.0
//var result: Double = number.truncatingRemainder(dividingBy: 1.5)
//print(result)
//result = 12.truncatingRemainder(dividingBy: 2.5)
//print(result)

var result: Int = 5 / 3
result = 10 / 3

var result2: Double = 10.0 / 3.0

var floatValue: Float = 10.0
var doubleValue: Double = 2.5

//print(floatValue / doubleValue)

var int8Value: Int8 = 10
var int16Value: Int16 = 20

//print(int8Value / int16Value)

//let valueA: Int = 3
//let valueB: Int = 5
//let valueC: Int = 5
//
//let isSameValueAB: Bool = valueA == valueB
//let isSameValueBC: Bool = valueB == valueC

//let referenceA: SomeClass = someClass()
//let referenceB: SomeClass = someClass()
//let referenceC: SomeClass = someClass()
//
//let isSameReferenceAB: Bool = referenceA === referenceB
//let isSameReferenceAC: Bool = referenceA === referenceC

var valueA: Int = 3
var valueB: Int = 5
var biggerValue: Int = valueA > valueB ? valueA : valueB

valueA = 0
valueB = -3
biggerValue = valueA > valueB ? valueA : valueB

var stringA: String = ""
var stringB: String = "String"
var resultValue: Double = stringA.isEmpty ? 1.0 : 0.0
resultValue = stringB.isEmpty ? 1.0 : 0.0

var unsignedInteger: UInt8 = 0
//let errorUnderflowResult: UInt8 = unsignedInteger - 1
let underflowedValue: UInt8 = unsignedInteger &- 1

unsignedInteger = UInt8.max
//let errorOverflowResult: UInt8 = unsignedInteger + 1
let overflowedValue: UInt8 = unsignedInteger &+ 1

//let valueInt: Int = someOptionalInt != nil ? someOptionalInt! : 0
//
//let valueInt: Int = someOptionalInt ?? 0

let intValue: Int = 1
let resultValue2: Int = intValue << 3 + 5
let resultValue3: Int = 1 * 3 + 5



