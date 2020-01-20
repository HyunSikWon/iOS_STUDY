//
//  StoreItem.swift
//  iTunesSearch
//
//  Created by 원현식 on 2020/01/20.
//  Copyright © 2020 Caleb Hicks. All rights reserved.
//

import Foundation

struct StoreItem: Codable {
    
    var name: String
    var artist: String
    var description: String
    var kind: String
    var artworkURL: URL
    
    init?(json: [String: Any]) {
        
        guard let name = json["trackName"] as? String,
            let artist = json["artistName"] as? String,
            let kind = json["kind"] as? String,
            let artworkURLString = json["artworkUrl100"] as? String,
            let artworkURL = URL(string: artworkURLString) else { return nil }
        
        self.name = name
        self.artist = artist
        self.kind = kind
        self.artworkURL = artworkURL
        
        self.description = json["description"] as? String ?? json["longDescription"] as? String ?? ""
    }
}


struct StoreItems: Codable {
    let results: [StoreItem]
}
