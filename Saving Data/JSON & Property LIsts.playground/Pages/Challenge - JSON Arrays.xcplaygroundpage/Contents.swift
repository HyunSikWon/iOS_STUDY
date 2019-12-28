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

let sticker2 = Sticker(
    name: "Taylor Wilson",
    birthday: DateComponents(calendar: .current,year: 1990, month: 5, day: 5).date!,
    normalizedPosition: CGPoint(x: 0.7, y: 0.5),
    imageName: "frog"
)

let stickers : [Sticker] = [ sticker, sticker2 ]


do {
    let jsonURL = URL(
        fileURLWithPath: "stickers",
        relativeTo: FileManager.documentDirectoryURL.appendingPathComponent(Image.Kind.sticker.rawValue)
    ).appendingPathExtension("json")
    
    
    let jsonEncoder = JSONEncoder()
    jsonEncoder.outputFormatting = .prettyPrinted
    let jsonData = try jsonEncoder.encode(stickers)
    try jsonData.write(to: jsonURL)
    
    let jsonDecoder = JSONDecoder()
    let savedJSONData = try Data(contentsOf: jsonURL)
    let jsonStickers = try jsonDecoder.decode([Sticker].self, from: savedJSONData)
    jsonStickers == stickers
    
    jsonStickers.map{ $0.image }
    
}
catch { print(error) }

FileManager.documentDirectoryURL

print(FileManager.documentDirectoryURL // ~~~/Documents
    .appendingPathComponent(Image.Kind.sticker.rawValue) // /sticker
    .appendingPathComponent("cat") // /cat
    .appendingPathExtension("png") // .png
    .path)
///Users/hyunsikwon/Library/Developer/XCPGDevices/D24DEADE-38BA-4191-AC0F-8C0A82C7A12F/data/Containers/Data/Application/052CADEF-FB65-4258-B85D-70FBB0FBDB05/Documents/sticker/cat.png


//print(FileManager.documentDirectoryURL
//.appendingPathComponent(Image.Kind.sticker.rawValue)
//.appendingPathComponent("cat")
//.appendingPathComponent("png")
//.path)
///Users/hyunsikwon/Library/Developer/XCPGDevices/D24DEADE-38BA-4191-AC0F-8C0A82C7A12F/data/Containers/Data/Application/052CADEF-FB65-4258-B85D-70FBB0FBDB05/Documents/sticker/cat/png
//: [Next](@next)
