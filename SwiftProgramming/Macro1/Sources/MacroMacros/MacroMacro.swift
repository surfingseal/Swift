import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

/// Implementation of the `stringify` macro, which takes an expression
/// of any type and produces a tuple containing the value of that expression
/// and the source code that produced the value. For example
///
///     #stringify(x + y)
///
///  will expand to
///
///     (x + y, "x + y")
public struct StringifyMacro: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) -> ExprSyntax {
        guard let argument = node.arguments.first?.expression else {
            fatalError("compiler bug: the macro does not have any arguments")
        }

        return "(\(argument), \(literal: argument.description))"
    }
}

public struct DoubleMacro: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) -> ExprSyntax {
        guard let argument = node.arguments.first?.expression else {
            fatalError("잘못된 입력입니다.")
        }
        return ExprSyntax("\(argument) * 2")
    }
}

public struct GenerateWeekEnumMacro: DeclarationMacro {
    public static func expansion (
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) -> [DeclSyntax] {
        
        guard node.arguments.count == 2,
              let nameExpr = node.arguments.first?.expression.as(StringLiteralExprSyntax.self),
              let casesExpr = node.arguments[node.arguments.index(at: 1)].expression.as(ArrayExprSyntax.self) else {
            fatalError("잘못된 매크로 입력: #generateWeekEnum(\"이름\", cases: [\"case1\", \"case2\"])")
        }
        
        let enumName = nameExpr.segments.description
        let cases = casesExpr.elements.compactMap { $0.expression.as(StringLiteralExprSyntax.self)?.segments.description }
        
        let enumDeclaration = """
        enum \(enumName) {
        \(cases.map { " case \($0) "}.joined(separator: "\n"))
        }
        """
        
        return [DeclSyntax(stringLiteral: enumDeclaration)]
    }
}

public struct AutoFactoryMacro: PeerMacro {
    public static func expansion(
        of node: AttributeSyntax,
        providingPeersOf declaration: some DeclSyntaxProtocol,
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        guard let typeDecl = StructDeclSyntax(declaration) else {
            fatalError("@AutoFactory는 구조체에서만 사용 가능합니다.")
        }
        
        let typeName = typeDecl.name.text
        
        let properties = typeDecl.memberBlock.members
            .flatMap { member -> [(String, String)] in
                guard let variableDecl = member.decl.as(VariableDeclSyntax.self) else { return [] }
                return variableDecl.bindings.compactMap { binding in guard let identifier = binding.pattern.as(IdentifierPatternSyntax.self) else
                    {return nil }
                    
                    let name = identifier.identifier.text
                    let type = binding.typeAnnotation?.type.description ?? "Any"
                    
                    return (name, type)
                }
            }
        
        let parameters = properties.map { "\($0.0): \($0.1)" }.joined(separator: ", ")
        
        let arguments = properties.map { "\($0.0): \($0.0)" }.joined(separator: ", ")
        
        let factoryFunction = """
            func create\(typeName)(\(parameters)) -> \(typeName) {
                return \(typeName)(\(arguments))
            }
            """
            
        return [DeclSyntax(stringLiteral: factoryFunction)]
    }
}

public struct AccessorsMacro: AccessorMacro {
    public static func expansion(
        of node: AttributeSyntax,
        providingAccessorsOf declaration: some DeclSyntaxProtocol,
        in context: some MacroExpansionContext
    ) throws -> [AccessorDeclSyntax] {
        guard let varDecl = declaration.as(VariableDeclSyntax.self),
              let firstBinding = varDecl.bindings.first,
              let identifier = firstBinding.pattern.as(IdentifierPatternSyntax.self) else {
            return []
        }
        
        let publicName = identifier.identifier.text
        let privateName = "_\(publicName)"
        
        let getter: AccessorDeclSyntax =
        """
        get {
            return \(raw: privateName)
        }
        """
        
        let setter: AccessorDeclSyntax =
        """
        set {
            \(raw: privateName) = newValue
        }
        """
        
        return [getter, setter]
    }
}

public struct AutoAccessorsAttributeMacro: MemberAttributeMacro {
    public static func expansion(
        of node: AttributeSyntax,
        attachedTo declaration: some DeclGroupSyntax,
        providingAttributesFor member: some DeclSyntaxProtocol,
        in context: some MacroExpansionContext
    ) throws -> [AttributeSyntax] {
        guard let varDecl = member.as(VariableDeclSyntax.self),
              !(varDecl.modifiers.contains { $0.name.text == "private" }),
              let firstBinding = varDecl.bindings.first,
              let identifier = firstBinding.pattern.as(IdentifierPatternSyntax.self) else {
            return []
        }
        
        let varName = identifier.identifier.text
        let privateVarName = "_" + varName
        
        let parentDecl = declaration.as(ClassDeclSyntax.self)
        let privateVarExists = parentDecl?.memberBlock.members.contains { member in
            guard let privateVar = member.decl.as(VariableDeclSyntax.self),
                  let privateBinding = privateVar.bindings.first,
                  let privateIdentifier = privateBinding.pattern.as(IdentifierPatternSyntax.self) else {
                return false
            }
            return privateIdentifier.identifier.text == privateVarName
        } ?? false
        
        if privateVarExists {
            let hasAccessors = varDecl.attributes.contains {
                $0.as(AttributeSyntax.self)?.attributeName.trimmedDescription == "Accessors"
            }
            
            if !hasAccessors {
                return ["@Accessors"]
            }
        }
        
        return []
    }
}

public struct AutoDescriptionMemberMacro: MemberMacro {
    public static func expansion(
        of node: AttributeSyntax,
        providingMembersOf declaration: some DeclGroupSyntax,
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        guard let structDecl = declaration.as(StructDeclSyntax.self) else {
            throw MacroExpansionErrorMessage("AutoDescriptionMember는 구조체에서만 사용 가능합니다.")
        }
        
        let properties = declaration.memberBlock.members.compactMap { member -> String? in
            guard let varDecl = member.decl.as(VariableDeclSyntax.self),
                  let firstBinding = varDecl.bindings.first,
                  let identifier = firstBinding.pattern.as(IdentifierPatternSyntax.self) else {
                return nil
            }
            return identifier.identifier.text
        }
        
        let descriptionBody = properties
            .map { "\($0): \\(\($0))"}
            .joined(separator: ", ")
        
        let descriptionProperty: DeclSyntax =
        """
        var description: String {
            return \"\(raw: structDecl.name.trimmed.description)(\(raw: descriptionBody))\"
        }
        """
        return [descriptionProperty]
    }
}

public struct AutoDescriptionMacro: ExtensionMacro {
    public static func expansion(
        of node: AttributeSyntax,
        attachedTo declaration: some DeclGroupSyntax,
        providingExtensionsOf type: some TypeSyntaxProtocol,
        conformingTo protocols: [TypeSyntax],
        in context: some MacroExpansionContext
    ) throws -> [ExtensionDeclSyntax] {
        let typeName = type.trimmed.description
        
        guard let structDecl = declaration.as(StructDeclSyntax.self) else {
            throw MacroExpansionErrorMessage("AutoDescripiton은 구조체에서만 사용 가능합니다.")
        }
        
        let properties = structDecl.memberBlock.members.compactMap { member -> String? in
            guard let varDecl = member.decl.as(VariableDeclSyntax.self),
                  let firstBinding = varDecl.bindings.first,
                  let identifier = firstBinding.pattern.as(IdentifierPatternSyntax.self) else {
                return nil
            }
            return identifier.identifier.text
        }
        
        let descriptionBody = properties
            .map { "\($0): \\(\($0))"}
            .joined(separator: ", ")
        
        let extensionDecl: DeclSyntax =
        """
        extension \(raw: typeName): CustomStringConvertible {
        var description: String {
            return \"\(raw: typeName)(\(raw: descriptionBody))\"
        }
        """
        
        return [extensionDecl.cast(ExtensionDeclSyntax.self)]
    }
}

@main
struct MacroPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        StringifyMacro.self,
        DoubleMacro.self,
        GenerateWeekEnumMacro.self,
        AutoFactoryMacro.self,
        AccessorsMacro.self,
        AutoAccessorsAttributeMacro.self,
        AutoDescriptionMemberMacro.self,
        AutoDescriptionMacro.self
    ]
}
