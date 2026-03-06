import UIKit

protocol WrappedPrize {
    associatedtype Prize
    
    var wrapColor: String! { get }
    var prize: Prize! { get }
}

protocol Gundam {}
protocol Pokemon {}

struct WrappedGundam: WrappedPrize {
    var wrapColor: String!
    var prize: (any Gundam)!
}

struct wrappedPokemon: WrappedPrize {
    var wrapColor: String!
    var prize: (any Pokemon)!
}

struct PrizeMachine {
    func dispenseRandomPrize() -> some WrappedPrize {
        return WrappedGundam()
    }
}

let machine: PrizeMachine = PrizeMachine()
let wrappedPrize = machine.dispenseRandomPrize()


protocol Animal {
    func makeSound() -> String
}

struct Dog: Animal {
    func makeSound() -> String { "멍멍!" }
}

struct Bird: Animal {
    func makeSound() -> String { "짹짹" }
}

struct Person {
    var pets: [any Animal]
}

let doggy: Dog = .init()
let swift: Bird = .init()
let yagom: Person = .init(pets: [doggy, swift])
