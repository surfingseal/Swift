import UIKit
import Foundation

let myFisrtTask: Task = Task.init(priority: .userInitiated) { print("안녕하세요? 작업입니다!") }
let mySecondTask: Task = Task.init { print("안녕하세요? 둘쨉니다!") }
let myThirdTask: Task = Task { print("안녕하세요? 셋쨉니다!") }
Task { print("꼭 변수/상수에 할당하지 않아도 실행됩니다!") }

func someAsyncWork() async -> String {
    return "async 함수라고 해서 꼭 await이 있어야 하는 것은 아닙니다. 자세한 것은 조금 뒤에 async/await에서 설명합니다."
}

func someFunction() {
    Task {
        let result: String = try await someAsyncWork()
    }
}

someFunction()

//func fetchData(from url: String) async throws -> String {
//    try await Task.sleep(for: .seconds(1))
//    return "\(url)로부터 데이터 가져오기"
//}
//
//func fetchDataConCurrently() async throws {
//    let urls: [String] = ["URL1", "URL2", "URL3"]
//    
//    for url in urls {
//        let data: String = try await fetchData(from: url)
//        await Task.yield()
//        print(data)
//    }
//}
//
//Task {
//    do {
//        try await fetchDataConCurrently()
//    } catch {
//        print("데이터를 가져오는 중 에러 발생: \(error)")
//    }
//}

//func fetchData(from url: String) async throws -> String {
//    try await Task.sleep(for: .seconds(1))
//    return "\(url)로부터 데이터 가져오기"
//}
//
//func fetchDataConcurrently() async throws {
//    async let firstData: String = fetchData(from: "url1")
//    async let secondData: String = fetchData(from: "url2")
//    async let thirdData: String = fetchData(from: "url3")
//    
//    let results: [String] = try await [firstData, secondData, thirdData]
//    print(results)
//}
//
//Task {
//    do {
//        try await fetchDataConcurrently()
//    } catch {
//        print("에러 발생: \(error)")
//    }
//}


//func fetchData(from url: String) async throws -> String {
//    print("\(url)에 네트워크 요청 중...")
//    try await Task.sleep(for: .seconds(1))
//    return "\(url)로부터 데이터"
//}
//
//func fetchAllData() async throws -> [String] {
//    let dataResult: [String] = try await withThrowingTaskGroup(of: String.self) {
//        group in
//        let urls: [String] = ["URL1", "URL2", "URL3"]
//        
//        for url in urls {
//            group.addTask {
//                try await fetchData(from: url)
//            }
//        }
//        
//        var results: [String] = []
//        
//        for try await result in group {
//            results.append(result)
//        }
//        
//        return results
//    }
//    return dataResult
//}
//
//print(try await fetchAllData())

//nonisolated(unsafe) var callCounter: Int = 0
//
//func fetchData(from url: String) async throws -> String {
//    print("\(url)에 네트워크 요청 중...")
//    callCounter += 1
//    try await Task.sleep(for: .seconds(callCounter))
//    return "\(url)로부터 데이터"
//}
//
//func fetchAllData() async throws -> [Result<String, Error>] {
//    let dataResult: [Result<String, Error>] = try await withThrowingTaskGroup(of: Result<String, Error>.self) {
//        group in
//        let urls: [String] = ["URL1", "URL2", "URL3"]
//        
//        for url in urls {
//            group.addTask {
//                do {
//                    try Task.checkCancellation()
//                    
//                    let result: String = try await fetchData(from: url)
//                    if Task.isCancelled {
//                        return .failure(CancellationError())
//                    }
//                    return .success(result)
//                } catch {
//                    return .failure(error)
//                }
//            }
//        }
//        
//        try await Task.sleep(for: .seconds(1.5))
//        
//        group.cancelAll()
//        
//        var results: [Result<String, Error>] = []
//        for try await result in group {
//            results.append(result)
//        }
//        
//        return results
//    }
//    
//    return dataResult
//}
//
//print(try await fetchAllData())



let someStructuredTask = Task {
    try await Task.sleep(for: .seconds(2))
}

let someUnstructuredTask = Task.detached {
    try await Task.sleep(for: .seconds(2))
}

//class BankAccountClass {
//    var balance: Int = 0
//    
//    func deposit(_ amount: Int) {
//        balance += amount
//    }
//    
//    func withdraw(_ amount: Int) {
//        balance -= amount
//    }
//}

//nonisolated(unsafe) let classAccount: BankAccountClass = BankAccountClass()
//
//for _ in 0..<100000 {
//    DispatchQueue.global().async {
//        classAccount.deposit(1)
//        classAccount.withdraw(1)
//    }
//}
//
//print(classAccount.balance)

//actor BankAccountActor {
//    var balance: Int = 0
//    
//    func deposit(_ amount: Int) {
//        balance += amount
//    }
//    
//    func withdraw(_ amount: Int) {
//        balance -= amount
//    }
//}

//let actorAccount: BankAccountActor = BankAccountActor()
//
//for _ in 0..<100000 {
//    await actorAccount.deposit(1)
//    await actorAccount.withdraw(1)
//}
//
//print(await actorAccount.balance)

class BankAccountClass {
    var balance: Int = 0
    
    func deposit(_ amount: Int) {
        balance += amount
    }
    
    func withdraw(_ amount: Int) {
        balance -= amount
    }
}

nonisolated(unsafe) let classAccount: BankAccountClass = BankAccountClass()

await withTaskGroup(of: Void.self) { group in
    for _ in 0..<100000 {
        group.addTask {
            classAccount.deposit(1)
        }
        
        group.addTask {
            classAccount.withdraw(1)
        }
    }
}

print(classAccount.balance)


actor BankAccountActor {
    var balance: Int = 0
    
    func deposit(_ amount: Int) {
        balance += amount
    }
    
    func withdraw(_ amount: Int) {
        balance -= amount
    }
}

let actorAccount: BankAccountActor = BankAccountActor()

await withTaskGroup(of: Void.self) { group in
    for _ in 0..<100 {
        group.addTask {
            await actorAccount.deposit(1)
        }
        
        group.addTask {
            await actorAccount.withdraw(1)
        }
    }
}

print(await actorAccount.balance)

struct UserInfo: Sendable {
    let username: String
    let email: String
}

func processUserInfo(userInfo: UserInfo) async throws {
    try await Task.sleep(for: .seconds(1))
    print("사용자 정보 처리 중... 이름: \(userInfo.username), 이메일: \(userInfo.email)")
}

func handleMultipleUserInfos() async throws {
    let users: [UserInfo] = [
        UserInfo(username: "user1", email: "user1@yagom.net"),
        UserInfo(username: "user2", email: "user2@yagom.net"),
        UserInfo(username: "user3", email: "user3@yagom.net")
    ]
    
    await withThrowingTaskGroup(of: Void.self) { group in
        for user in users {
            group.addTask {
                try await processUserInfo(userInfo: user)
            }
        }
    }
}

try await handleMultipleUserInfos()

@MainActor
final class Account: Sendable {
    let accountID: String
    var balance: Int
    
    init(accountID: String, balance: Int) {
        self.accountID = accountID
        self.balance = balance
    }
    
    func updateBalance(newBalance: Int) {
        balance = newBalance
    }
}

func processAccount(account: Account) async throws {
    try await Task.sleep(for: .seconds(1))
    print("게좌 정보 처리 중... 계좌: \(account.accountID), 잔고: \(await account.balance)")
}

func handleMultipleAccounts() async throws {
    let accounts: [Account] = await [
        Account(accountID: "12345", balance: 5000),
        Account(accountID: "67890", balance: 3000),
        Account(accountID: "54321", balance: 7000)
    ]
    
    await withThrowingTaskGroup(of: Void.self) { group in
        for account in accounts {
            group.addTask {
                try await processAccount(account: account)
            }
        }
    }
}

try await handleMultipleAccounts()

struct SomeType { }

@available(*, unavailable)
extension SomeType: Sendable { }

struct Person {
    var name: String
    var age: Int
}

var yagom: Person = Person(name: "yagom", age: 20)
var me: Person = yagom

me.name = "Hana"

print(yagom.name)
print(me.name)

struct DatabaseConnection: Copyable {
    private var connectionID: Int
    
    init(connectionID: Int) {
        self.connectionID = connectionID
        print("Database connected with ID: \(connectionID)")
    }
    
    func executeQuery(_ query: String) {
        print("Executing query on connection \(connectionID): \(query)")
    }
}

func performDatabaseOperations() {
    let dbConnection: DatabaseConnection = DatabaseConnection(connectionID: 123)
    let dbConnectionCopy: DatabaseConnection = dbConnection
    
    dbConnectionCopy.executeQuery("SELECT * FROM users")
    dbConnection.executeQuery("SELECT * FROM orders")
}

performDatabaseOperations()

struct NetworkSocket: ~Copyable {
    private var socketDescriptor: Int32
    
    init(socketDescriptor: Int32) {
        self.socketDescriptor = socketDescriptor
        print("Network socket opened with descriptor: \(socketDescriptor)")
    }
    
    func sendData(_ data: Data) {
        print("Sending data through socket \(socketDescriptor): \(data)")
    }
    
    deinit {
        print("Closing network socket with descriptor: \(socketDescriptor)")
    }
}

func performNetworkOperations() {
    let socket: NetworkSocket = NetworkSocket(socketDescriptor: 456)
//    let socket2: NetworkSocket = socket
    socket.sendData(Data([0x01, 0x02, 0x03]))
}

performNetworkOperations()
