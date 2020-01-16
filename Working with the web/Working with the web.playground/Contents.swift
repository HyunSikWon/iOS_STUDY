import UIKit
import PlaygroundSupport // playground don't support asynchronous code.
//They are designed to execute code on a single queue. running the code from the top to bottom.
PlaygroundPage.current.needsIndefiniteExecution = true
// The line you just added enables the playground to wait for the network request to finish and run the completion handler

extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.map {
            URLQueryItem(name: $0.0, value: $0.1)
        }
        return components?.url
    }
}

// MARK: - 실습1
//let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY")!
//
//let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//    if let data = data,
//        let string = String(data: data, encoding: .utf8){
//
//        print(string)
//
//    }
//    PlaygroundPage.current.finishExecution() // That's when you know the request is finish and the playground can stop running
//}
//
//task.resume()

// MARK: - 실습2
//let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")!
//
//let query: [String:String] = [
//    "api_key" : "DEMO_KEY",
//    "date" : "2011-07-13",
//]
//
//let url = baseURL.withQueries(query)!
//let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//    if let data = data,
//        let string = String(data: data, encoding: .utf8){
//        print(string)
//    }
//    PlaygroundPage.current.finishExecution()
//}
//
//task.resume()

// MARK: - 실습3
//let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")!
//
//let query: [String:String] = [
//    "api_key" : "DEMO_KEY",
//    "date" : "2011-07-13",
//]
//
//let url = baseURL.withQueries(query)!
//let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//    let jsonDecoder = JSONDecoder()
//    if let data = data,
//        let photoDictionary = try? jsonDecoder.decode([String: String].self, from: data){
//        print(photoDictionary)
//    }
//    PlaygroundPage.current.finishExecution()
//
//}
//
//task.resume()

// MARK: - 실습4

struct PhotoInfo: Codable {
    var title: String
    var description: String
    var url: URL
    var copyright: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case description = "explanation"
        case url
        case copyright
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try valueContainer.decode(String.self, forKey: .title)
        self.description = try valueContainer.decode(String.self, forKey: .description)
        self.url = try valueContainer.decode(URL.self, forKey: .url)
        self.copyright = try valueContainer.decode(String.self, forKey: .copyright)
        
    }
    
}

struct Report: Codable {
    let creationDate: Date
    let profileID: String
    let readCount: Int
    
    enum CodingKeys: String, CodingKey {
        case creationDate = "report_date"
        case profileID = "profile_id"
        case readCount = "read_count"
    }
}

func fetchPhotoInfo(completion: @escaping (PhotoInfo?) -> Void) {
    let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")!
    let query: [String:String] = [
        "api_key" : "DEMO_KEY"
    ]

    let url = baseURL.withQueries(query)!
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        let jsonDecoder = JSONDecoder()
        if let data = data,
            let photoInfo = try? jsonDecoder.decode(PhotoInfo.self, from: data) {
            completion(photoInfo)
        } else {
            print("Either no data was returned, or data was not properly decoded")
            completion(nil)
        }
        
        PlaygroundPage.current.finishExecution()
    }

    task.resume()
}

fetchPhotoInfo { (fetchedInfo) in
    print(fetchedInfo)
}




