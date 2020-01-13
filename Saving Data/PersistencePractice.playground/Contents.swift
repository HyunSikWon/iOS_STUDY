import UIKit

struct Note : Codable {
    let title: String
    let text: String
    let timestamp: Date
}

let newNote = Note(title: "Grocery run", text: "Pick up mayonnaise, mustard, lettuce, tomato, and pickles.", timestamp: Date())

let note1 = Note(title: "Note One", text: "This is a sample note", timestamp: Date())
let note2 = Note(title: "Note Two", text: "This is another sample note", timestamp: Date())
let note3 = Note(title: "Note Three", text: "This is yet another sample note", timestamp: Date())
let notes = [note1, note2, note3]

// MARK: - 실습 1
//let pListEncoder = PropertyListEncoder()
//
//if let encodedNote = try? pListEncoder.encode(newNote) {
//    print(encodedNote)
//
//    let pListDecoder = PropertyListDecoder()
//
//    if let decodedNote = try? pListDecoder.decode(Note.self, from: encodedNote) {
//        print(decodedNote)
//    }
//}

// MARK: - 실습 2
//let documentsDirectoy = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//
//let archiveURL = documentsDirectoy.appendingPathComponent("notes_test").appendingPathExtension("plist")
//
//let pListEncoder = PropertyListEncoder()
//let encodedNote = try? pListEncoder.encode(newNote)
//
//try? encodedNote?.write(to: archiveURL, options: .noFileProtection)
//
//let pListDecoder = PropertyListDecoder()
//
//if let retrievedNoteData = try? Data(contentsOf: archiveURL),
//    let decodedData = try? pListDecoder.decode(Note.self, from: retrievedNoteData) {
//    print(decodedData)
//}

// MARK: - 실습 3

let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!

let archiveURL = documentsDirectory.appendingPathComponent("notes_test").appendingPathExtension("plist")

let pListEncoder = PropertyListEncoder()

let encodedNotes = try? pListEncoder.encode(notes)
try? encodedNotes?.write(to: archiveURL, options: .noFileProtection) // .noFileProtection 덮어쓸 수 있음.

let pListDecoder = PropertyListDecoder()

if let retrievedNotesData = try? Data(contentsOf: archiveURL),
    let decodedNotes = try? pListDecoder.decode(Array<Note>.self, from: retrievedNotesData) {
    for decodedNote in decodedNotes {
        print(decodedNote)
    }
}









