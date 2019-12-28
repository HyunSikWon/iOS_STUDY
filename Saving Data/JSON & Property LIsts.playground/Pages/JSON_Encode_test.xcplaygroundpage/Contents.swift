//: [Previous](@previous)

import UIKit


FileManager.documentDirectoryURL

let hyunsik = UserInfo(
    name: "Won Hyunsik",
    age: 23,
    birthday: DateComponents(calendar: .current, year: 1996, month: 6, day: 1).date!
)


do {
    let jsonURL = URL(
        fileURLWithPath: "User_Info",
        relativeTo: FileManager.documentDirectoryURL
    )
    
    let jsonEncoder = JSONEncoder()
    jsonEncoder.outputFormatting = .prettyPrinted
    let jsonData = try jsonEncoder.encode(hyunsik)
    try jsonData.write(to: jsonURL)
    
    
} catch { print(error) }


//: [Next](@next)
