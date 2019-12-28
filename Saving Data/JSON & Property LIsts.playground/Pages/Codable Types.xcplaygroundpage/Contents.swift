//: [Previous](@previous)

import UIKit

for image in try! [Image](fileName: "images") {
    try! image.save(directory: .documentDirectory)
}

let sticker = Sticker(
    name: "David Meowie",
    birthday: DateComponents(calendar: .current, year: 1947, month: 1, day: 8).date!,
    normalizedPosition: CGPoint(x: 0.3, y: 0.5),
    imageName: "cat"
)

do {
    let jsonURL = URL(
        fileURLWithPath: sticker.name, // David Meowie 저장되는 파일 이름
        relativeTo: FileManager.documentDirectoryURL.appendingPathComponent(Image.Kind.sticker.rawValue) // 파일 저장 경로 Documents/sticker/
    )
    
    let jsonEncoder = JSONEncoder()
    jsonEncoder.outputFormatting = .prettyPrinted // json형식으로 들여쓰기 등 해줌.
    let jsonData = try jsonEncoder.encode(sticker)
    try jsonData.write(to: jsonURL)
    
    let jsonDecoder = JSONDecoder()
    let savedJSONData = try Data(contentsOf: jsonURL)
    let jsonSticker = try jsonDecoder.decode(Sticker.self, from: savedJSONData)
     
    jsonSticker == sticker
    
} catch { print(error) }

FileManager.documentDirectoryURL


//: [Next](@next)
