//: [Previous](@previous)

import Foundation

let mysteryDataURL = URL(
  fileURLWithPath: "mystery",
  relativeTo: FileManager.documentDirectoryURL
)
mysteryDataURL.path


//: ## String
let stringURL =
  FileManager.documentDirectoryURL
  .appendingPathComponent("string")
  .appendingPathExtension("txt")

stringURL.path


//: ## Challenge
let challengeString: String = "HyunsikWon"
let challengeStringURL = URL(fileURLWithPath: challengeString, relativeTo: FileManager.documentDirectoryURL).appendingPathExtension("txt")

challengeStringURL.path
challengeStringURL.lastPathComponent

//let challengeStringURL: URL = FileManager.documentDirectoryURL.appendingPathExtension(challengeString).appendingPathExtension("txt")
///Users/hyunsikwon/Library/Developer/XCPGDevices/D24DEADE-38BA-4191-AC0F-8C0A82C7A12F/data/Containers/Data/Application/5D75DE0C-28B1-4484-8A31-FDBEF918A49F/Documents.HyunsikWon.txt

//: [Next](@next)
