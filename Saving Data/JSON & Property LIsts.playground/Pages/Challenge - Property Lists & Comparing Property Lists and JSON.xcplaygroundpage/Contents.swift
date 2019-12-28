//: [Previous](@previous)

import UIKit

for image in try! [Image](fileName: "images") {
  try! image.save(directory: .documentDirectory)
}

let scenes = [
  Scene(
    width: 700,
    hasReverseGravity: false,
    backgroundName: "Forest",
    stickers: [
      Sticker(
        name: "Catwarts",
        birthday: DateComponents(
          calendar: .current,
          year: 1014, month: 10, day: 7
        ).date,
        normalizedPosition: CGPoint(x: 0.27, y: 0.25),
        imageName: "castle"
      ),
      Sticker(
        name: "Professor Froggonagle",
        birthday: nil,
        normalizedPosition: CGPoint(x: 0.15, y: 0.65),
        imageName: "frog"
      ),
      Sticker(
        name: "Mr. Basilisk",
        birthday: DateComponents(
          calendar: .current,
          year: 2, month: 3, day: 17
        ).date,
        normalizedPosition: CGPoint(x: 0.7, y: 0.38),
        imageName: "coiled snake"
      )
    ]
  ),
  Scene(
    width: 700,
    hasReverseGravity: false,
    backgroundName: "Winterfence",
    stickers: [
      Sticker(
        name: "House Bark",
        birthday: nil,
        normalizedPosition: CGPoint(x: 0.8, y: 0.05),
        imageName: "castle"
      ),
      Sticker(
        name: "Doggh Snow",
        birthday: DateComponents(
          calendar: .current,
          year: 1209, month: 2, day: 15
        ).date,
        normalizedPosition: CGPoint(x: 0.2, y: 0.6),
        imageName: "dog"
      )
    ]
  ),
  Scene(
    width: 700,
    hasReverseGravity: true,
    backgroundName: "Space",
    stickers: [
      Sticker(
        name: "Space Count Monkula",
        birthday: DateComponents(
          calendar: .current,
          year: 3006, month: 1, day: 1
        ).date,
        normalizedPosition: CGPoint(x: 0.7, y: 0.45),
        imageName: "space monkey"
      ),
      Sticker(
        name: "Castle Monkula",
        birthday: nil,
        normalizedPosition: CGPoint(x: 0.2, y: 0.2),
        imageName: "castle"
      )
    ]
  )
]

do {
  let scenesURL = URL(
    fileURLWithPath: "scenes",
    relativeTo: FileManager.documentDirectoryURL.appendingPathComponent(Image.Kind.scene.rawValue)
    )
    
    let jsonURL = scenesURL.appendingPathExtension("json")
    
    let plistURL = scenesURL.appendingPathExtension("plist")
    
    let jsonEncoder = JSONEncoder()
    jsonEncoder.outputFormatting = .prettyPrinted
    jsonEncoder.dateEncodingStrategy = .iso8601
    // json형식으로 변환
    let jsonData = try jsonEncoder.encode(scenes)
    // 변환 후 저장
    try jsonData.write(to: jsonURL)
    
    let jsonDecoder = JSONDecoder()
    jsonDecoder.dateDecodingStrategy = .iso8601
    // 저장된 JSON 형식의 데이터를 불러와서
    let savedJSONData = try Data(contentsOf: jsonURL)
    // swift로 decode
    let jsonScenes = try jsonDecoder.decode([Scene].self, from: savedJSONData)
    
    jsonScenes == scenes
    
    let plistEncoder = PropertyListEncoder()
    plistEncoder.outputFormat = .xml
    let plistData = try plistEncoder.encode(scenes)
    try plistData.write(to: plistURL)

    let plistDecoder = PropertyListDecoder()
    let savedPlistData = try Data(contentsOf: plistURL)
    let plistScenes = try plistDecoder.decode([Scene].self, from: savedPlistData)
    
    plistScenes == scenes
    
    jsonScenes == plistScenes
    
    jsonScenes.map{ $0.view }

}
catch { print(error) }

FileManager.documentDirectoryURL


//: [Next](@next)
