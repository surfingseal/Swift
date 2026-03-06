import UIKit

//let drawer: String? = "yagom"
//var tree: String = ""
//
//for i in 0...3 {
//    for _ in 1...(4 - i) { tree += " " }
//    for _ in 1...(1 + i * 2) { tree += "*" }
//    for _ in 1...(4 - i) { tree += " " }
//    
//    tree += "\n"
//}
//
//tree += "    *\n"
//tree += "   ***\n"
//tree += "DRAWER : \(drawer ?? "unknown")"
//
//print(tree)
//
protocol Drawable {
    func draw() -> String
}

struct Composed: Drawable {
    var lines: [any Drawable]
    func draw() -> String {
        var result: String = ""
        for line in lines {
            result += line.draw()
        }
        return result
    }
}

struct Text: Drawable {
    var content: String
    init(_ content: String) { self.content = content }
    func draw() -> String { return content }
}

struct Space: Drawable {
    var length: Int
    func draw() -> String { return String(repeating: " ", count: length) }
    init(_ length: Int = 1) { self.length = length }
}

struct Linebreak: Drawable {
    func draw() -> String { return "\n" }
}

struct Star: Drawable {
    var length: Int
    func draw() -> String { return String(repeating: "*", count: length) }
    init(_ length: Int = 1) { self.length = length }
}

struct AllCaps: Drawable {
    var content: any Drawable
    func draw() -> String { return content.draw().uppercased() }
}

//let drawer: String? = "moon"
//let tree: Composed = Composed(lines: [
//    Space(4), Star(), Space(4), LineBreak(),
//    Space(3), Star(3), Space(3), LineBreak(),
//    Space(2), Star(5), Space(2), LineBreak(),
//    Space(1), Star(7), Space(1), LineBreak(),
//    Space(4), Star(), Space(4), LineBreak(),
//    Space(3), Star(3), Space(3), LineBreak(),
//    AllCaps(content: Text(("DRAWER: \(drawer ?? "unknown")")))
//])

//print(tree.draw())

@resultBuilder
struct DrawingBuilder {
    static func buildBlock(_ components: Drawable...) -> Drawable {
        return Composed(lines: components)
    }
}

func draw(@DrawingBuilder content: () -> Drawable) -> Drawable {
    return content()
}

func caps(@DrawingBuilder content: () -> Drawable) -> Drawable {
    return AllCaps(content: content())
}

//let drawer: String? = "yagom"

//let tree = draw {
//    Space(4)
//    Star()
//    Space(4)
//    Linebreak()
//    Space(3)
//    Star(3)
//    Space(3)
//    Linebreak()
//    Space(2)
//    Star(2)
//    Linebreak()
//    Space(1)
//    Star(7)
//    Space(1)
//    Linebreak()
//    Space(4)
//    Star()
//    Space(4)
//    Linebreak()
//    Space(3)
//    Star(3)
//    Space(3)
//    Linebreak()
//    caps {
//        Text("Drawer : \(drawer ?? "unknown")")
//    }
//}
//
//print(tree.draw())

extension DrawingBuilder {
    static func buildEither(first: Drawable) -> Drawable {
        return first
    }
    
    static func buildEither(second: Drawable) -> Drawable {
        return second
    }
    
    static func buildArray(_ components: [Drawable]) -> Drawable {
        return Composed(lines: components)
    }
}

let drawer: String? = "yagom"
let tree = draw {
    for i in 0...3 {
        Space(4 - i)
        Star(1 + i * 2)
        Space(4 - i)
        Linebreak()
    }
    Space(4)
    Star()
    Space(4)
    Linebreak()
    Space(3)
    Star(3)
    Space(3)
    Linebreak()
    caps {
        if let drawer {
            Text("Drawer: \(drawer)")
        } else {
            Text("unknown")
        }
    }
}

print(tree.draw())
