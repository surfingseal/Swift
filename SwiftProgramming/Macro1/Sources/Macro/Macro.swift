// The Swift Programming Language
// https://docs.swift.org/swift-book

/// A macro that produces both a value and a string containing the
/// source code that generated the value. For example,
///
///     #stringify(x + y)
///
/// produces a tuple `(x + y, "x + y")`.
@freestanding(expression)
public macro stringify<T>(_ value: T) -> (T, String) = #externalMacro(module: "MacroMacros", type: "StringifyMacro")

@freestanding(expression)
public macro double<T>(_ value: T) -> T = #externalMacro(module: "MacroMacros", type: "DoubleMacro")

@freestanding(declaration, names: named(Week))
public macro generateWeekEnum(named: String, cases: [String]) = #externalMacro(module: "MacroMacros", type: "GenerateWeekEnumMacro")

@attached(peer, names: prefixed(create))
public macro AutoFactory() = #externalMacro(module: "MacroMacros", type: "AutoFactoryMacro")

@attached(accessor)
public macro Accessors() = #externalMacro(module: "MacroMacros", type: "AccessorsMacro")

@attached(memberAttribute)
public macro AutoAccessors() = #externalMacro(module: "MacroMacros", type: "AutoAccessorsAttributeMacro")

@attached(member, names: arbitrary)
public macro AutoDescriptionMember() = #externalMacro(module: "MacroMacros", type: "AutoDescriptionMemberMacro")
