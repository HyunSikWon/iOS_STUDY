//
//  Athlete.swift
//  FavoriteAthlete
//
//  Created by 원현식 on 2020/01/11.
//  Copyright © 2020 Hyunsik Won. All rights reserved.
//

import Foundation

struct Athlete: Codable {
    var name: String
    var age: String
    var team: String
    var league: String
    
    var description: String {
        return "\(age) years old, \(team) / \(league) "
    }
    
    static var archiveURL: URL {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentDirectory.appendingPathComponent("athletes").appendingPathExtension("plist")
    }
    
    static func saveToFiles(athletes: [Athlete]) {
        let pListEncoder = PropertyListEncoder()
        let encodedAthletes = try? pListEncoder.encode(athletes)
        try? encodedAthletes?.write(to: Athlete.archiveURL)
        
    }
    
    static func loadFromFile() -> [Athlete] {
        let pListDecoder = PropertyListDecoder()
        var athletesArr: [Athlete] = []
        
        if let retrievedAthletesData = try? Data(contentsOf: Athlete.archiveURL),
            let decodedAthletes = try? pListDecoder.decode(Array<Athlete>.self, from: retrievedAthletesData) {
            athletesArr = decodedAthletes
            
        }
        
        return athletesArr
        
    }
    
    static func loadSampleAthletes() -> [Athlete]  {
           let athletes: [Athlete] = [Athlete(name: "Hyunjin-Ryu", age: "32", team: "Blue Jays", league: "MLB"),
                                      Athlete(name: "Tyler Wilson", age: "30", team: "LG Twins", league: "KBO")]
           
           return athletes
       }
       
    
}
