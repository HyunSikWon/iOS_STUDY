import UIKit

struct Note : Codable {
    let title: String
    let text: String
    let timestamp: Date
}

let newNote = Note(title: "Grocery run", text: "Pick up mayonnaise, mustard, lettuce, tomato, and pickles.", timestamp: Date())

let pListEncoder = PropertyListEncoder()

if let encodedNote = try? pListEncoder.encode(newNote) {
    print(encodedNote)
    
    let pListDecoder = PropertyListDecoder()

    if let decodedNote = try? pListDecoder.decode(Note.self, from: encodedNote) {
        print(decodedNote)
    }
}


