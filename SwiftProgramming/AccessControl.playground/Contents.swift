import UIKit

var boolValue: Bool = Bool()

print(boolValue)

open class OpenClass {
    open var openProperty: Int = 0
    public var publicProperty: Int = 0
    internal var internalProperty: Int = 0
    fileprivate var fileProperty: Int = 0
    private var privateProperty: Int = 0
    
    open func openMethod() {}
    public func publicMethod() {}
    internal func internalMethod() {}
    fileprivate func fileMethod() {}
    private func privateMethod() {}
}

public class PublicClass {}
public struct PublicStruct {}
public enum PublicEnum {}
public var publicVariable = 0
public let publicConstant = 0
public func publicFunc() {}

//internal class InternalClass {}
internal struct InternalStruct {}
internal enum InternalEnum {}
internal var internalValue = 0
internal let internalConstant = 0
internal func internalFunction() {}

fileprivate class FilePrivateClass {}
fileprivate struct FilePrivateStruct {}
fileprivate enum FilePrivateEnum {}
fileprivate var filePrivateVariable = 0
fileprivate let filePrivateConstant = 0
fileprivate func filePrivateFunction() {}

private class PrivateClass {}
//private struct PrivateStruct {}
private enum PrivateEnum {}
private var privateVariable = 0
private let privateConstant = 0
private func privateFunction() {}

//public func someFunction(a: AClass) -> AClass {
//    return a
//}

internal class InternalClass {}
private struct PrivateStruct {}

//public var publicTuple: (first: InternalClass, second: PrivateStruct) = (InternalClass(), PrivateStruct())

private var privateTuple: (first: InternalClass, secont: PrivateStruct) = (InternalClass(), PrivateStruct())


//AClass.swift 파일과 common.swift 파일이 같은 모듈에 속해 있을 경우

// AClass.swift 파일
class AClass {
    func internalMethod() {}
    fileprivate func filePrivateMethod() {}
    var internalProperty = 0
    fileprivate var filePrivateProperty = 0
}

// Common.swift 파일
let aInstance: AClass = AClass() // 같은 모듈이므로 생성 가능
aInstance.internalMethod() // 같은 모듈이므로 호출 가능
aInstance.filePrivateMethod() // 다른 파일이므로 호출 불가 - 오류
aInstance.internalProperty = 1 // 같은 모듈이므로 접근 가능
aInstance.filePrivateProperty = 1 //다른 파일이므로 접근 불가 - 오류

private typealias PointValue = Int

//enum Point: PointValue {
//    case x, y
//}

//public struct SomeType {
//    private var privateVariable = 0
//    fileprivate var fileprivateVariable = 0
//}
//
//extension SomeType {
//    public func publicMethod() {
//        print("\(self.privateVariable), \(self.fileprivateVariable)")
//    }
//    
//    private func privateMethod() {
//        print("\(self.privateVariable), \(self.fileprivateVariable)")
//    }
//    
//    fileprivate func filePrivateMethod() {
//        print("\(self.privateVariable), \(self.fileprivateVariable)")
//    }
//}
//
//struct AnotherType {
//    var someInstance: SomeType = SomeType()
//    
//    mutating func someMethod() {
//        self.someInstance.publicMethod()
//        
//        self.someInstance.fileprivateVariable = 100
//        self.someInstance.filePrivateMethod()
//        
////        self.someInstance.privateVariable = 100
////        self.someInstance.privateMethod()
//    }
//}

//var anotherInstance = AnotherType()
//anotherInstance.someMethod()

public struct SomeType {
    private var count: Int = 0
    
    public var publicStoredProperty: Int = 0
    
    public private(set) var publicGetOnlyStoredProperty: Int = 0
    
    internal var internalComputedProperty: Int {
        get {
            return count
        }
        
        set {
            count += 1
        }
    }
    
    internal private(set) var internalGetOnlyComputedProperty: Int {
        get {
            return count
        }
        
        set {
            count += 1
        }
    }
    
    public subscript() -> Int {
        get {
            return count
        }
        
        set {
            count += 1
        }
    }
    
    public internal(set) subscript(some: Int) -> Int {
        get {
            return count
        }
        
        set {
            count += 1
        }
    }
 }

var someInstance: SomeType = SomeType()

print(someInstance.publicStoredProperty)
someInstance.publicStoredProperty = 100

print(someInstance.publicGetOnlyStoredProperty)
//someInstance.publicGetOnlyStoredProperty = 100

print(someInstance.internalComputedProperty)
someInstance.internalComputedProperty = 100
print(someInstance.internalComputedProperty)

print(someInstance.internalGetOnlyComputedProperty)
//someInstance.internalGetOnlyComputedProperty = 100

print(someInstance[])
someInstance[] = 100

print(someInstance[0])
someInstance[0] = 100



