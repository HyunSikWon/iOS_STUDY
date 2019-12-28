import UIKit

public struct UserInfo : Codable {
    public let name : String
    public let age : Int
    public let birthday : Date?
    
    public init(name : String, age : Int, birthday : Date?) {
        self.name = name
        self.age = age
        self.birthday = birthday
    }
}

