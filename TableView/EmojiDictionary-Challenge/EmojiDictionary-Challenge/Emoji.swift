//
//  Emoji.swift
//  EmojiDictionary-Challenge
//
//  Created by 원현식 on 2020/01/02.
//  Copyright © 2020 Hyunsik Won. All rights reserved.
// model

import Foundation

struct Emoji {
    var symbol : String
    var name : String
    var description : String
    var usage : String
    
    init(symbol : String, name : String, description : String, usage : String) {
        self.symbol = symbol
        self.name = name
        self.description = description
        self.usage = usage
    }
    
    enum Section : Int, CaseIterable {
        case SmileysPeople,AnimalsNature,FoodDrink,Acitivty,TravlePlaces,Objects,Symbols,Flags
    }
    

}

