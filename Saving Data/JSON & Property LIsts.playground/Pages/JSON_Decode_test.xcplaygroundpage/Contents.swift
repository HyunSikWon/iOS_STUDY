//: [Previous](@previous)

import Foundation

struct BookInfo : Decodable {
    
    enum Kind : String, Decodable {
        case computer
        case novel
        case civilization
    }
    
    let title : String
    let bookKind : Kind
    let author : String
    let publisher : String
    let price : String
    
    enum decodingError : Error {
        case missingFile
    }
}

extension Array where Element == BookInfo {
    init(fileName : String) throws {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            throw BookInfo.decodingError.missingFile
        }
        
        let decoder = JSONDecoder()
        let data = try Data(contentsOf: url)
        self = try decoder.decode([BookInfo].self, from: data)
        
    }
}

let userInfoes = try [BookInfo](fileName : "book_info")

let titles = userInfoes.filter{ $0.bookKind.rawValue == "computer" }.map{ $0.title }

for title in titles {
    print(title)
}

//: [Next](@next)
