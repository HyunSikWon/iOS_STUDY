import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true


extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.map {
            URLQueryItem(name: $0.0, value: $0.1)
        }
        return components?.url
    }
}

// MARK: - 실습 1
//let baseURL = URL(string: "https://itunes.apple.com/search")!
//
//let query: [String: String] = [
//    "term" : "yerin+baek",
//    "media": "music",
//    "entity":"album",
//
//]
//
//let url = baseURL.withQueries(query)!
//
//let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//    if let data = data,
//        let string = String(data: data, encoding: .utf8){
//        print(string)
//    }
//    PlaygroundPage.current.finishExecution()
//}
//
//task.resume()


// MARK: - 실습 2
struct StoreItem: Codable {
    var kind: String
    var artist: String
    var albumName: String
    var copyright: String?
    
    enum CodingKeys: String, CodingKey {
        case kind = "collectionType"
        case artist = "artistName"
        case albumName = "collectionName"
        case copyright = "copyright"
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.kind = try valueContainer.decode(String.self, forKey: .kind)
        self.artist = try valueContainer.decode(String.self, forKey: .artist)
        self.albumName = try valueContainer.decode(String.self, forKey: .albumName)
        self.copyright = try valueContainer.decode(String.self, forKey: .copyright)
    }
}

struct StoreItems: Codable {
    let results: [StoreItem]
}

let query: [String: String] = [
    "term" : "yerin+baek",
    "media": "music",
    "entity":"album",
]


func fetchItems(matching query: [String: String], completion: @escaping ([StoreItem]?) -> Void) {
    let baseURL = URL(string: "https://itunes.apple.com/search?")!
    
    guard let url = baseURL.withQueries(query) else {
        completion(nil)
        print("Unable to build URL with supplied queries")
        return
    }
    
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        let jsonDecoder = JSONDecoder()
        if let data = data,
            let storeItems = try? jsonDecoder.decode(StoreItems.self, from: data) {
            completion(storeItems.results)
        } else {
            print("No data was returned, or data was not serialized.")
            completion(nil)
            return
        }
        PlaygroundPage.current.finishExecution()
    }
    
    task.resume()
}

fetchItems(matching: query) { (fetchedItems) in
    if let fetchedItems = fetchedItems {
        for fetchedItem in fetchedItems {
            print(fetchedItem)
        }
    }
    
}
