//
//  PhotoInfoController.swift
//  SpacePhoto
//
//  Created by 원현식 on 2020/01/19.
//  Copyright © 2020 Hyunsik Won. All rights reserved.
//

import Foundation

class PhotoInfoController {
    func fetchPhotoInfo(completion: @escaping (PhotoInfo?) -> Void) {
        let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")!
        let query: [String: String] = [
            "api_key" : "DEMO_KEY",
            "date" : "2020-01-12"
        ]

        let url = baseURL.withQueries(query)!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data,
                let photoInfo = try? jsonDecoder.decode(PhotoInfo.self, from: data) {
                print(photoInfo)
                completion(photoInfo)
            } else {
                print("Either no data was returned, or data was not properly decoded")
                completion(nil)
            }
        }

        task.resume()
    }
    
}
