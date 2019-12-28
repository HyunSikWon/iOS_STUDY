//: [Previous](@previous)

// JSON JavaSrcipt Object Notation
// JS objects are like [String : Any]

// in Swift
//["Bat" , "🦇" , "Hat" , "🎩"]
//["Bat" : "🦇" , "Hat" : "🎩"]

//in JavaSrcipt
//["Cat", "🐯", "chat", "🗣"]
//{"Cat" : "🐯", "chat" : "🗣"}

// Data Types
// Bool & Floating-point numbers
// Integer
// String
// Array
// Dictionary<String, Any>
//-----------------------
// Data : encode using Strings


import UIKit

struct Image : Decodable  {
    enum Kind : String, Decodable {
        case scene
        case sticker
    }
    
    enum DecodingError : Error {
        case missingFile
    }
    
    let name : String
    let kind : Kind
    let pngData : Data
}

extension Array where Element == Image {
    init(fileName : String) throws {
        // 파일을 못찾으면 nil을 반환 --> 그러면 error처리
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            throw Image.DecodingError.missingFile
        }
        
        let decoder = JSONDecoder()
        let data = try Data(contentsOf: url)
        self = try decoder.decode([Image].self, from: data)
    }
}

let images = try [Image](fileName: "images")
images.map{ UIImage(data : $0.pngData) }
//UIImage(data: image.pngData)

//: [Next](@next)
