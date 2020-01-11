//
//  Athlete.swift
//  FavoriteAthlete
//
//  Created by 원현식 on 2020/01/11.
//  Copyright © 2020 Hyunsik Won. All rights reserved.
//

import Foundation

struct Athlete {
    var name: String
    var age: String
    var team: String
    var league: String
    
    var description: String {
        return "\(age) years old, \(team) / \(league) "
    }
    
}
