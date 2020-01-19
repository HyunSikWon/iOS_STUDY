//
//  PhotoInfo.swift
//  SpacePhoto
//
//  Created by 원현식 on 2020/01/19.
//  Copyright © 2020 Hyunsik Won. All rights reserved.
//

import Foundation

struct PhotoInfo: Codable {
    var title: String
    var description: String
    var url: URL // points to the photo you want to display
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
