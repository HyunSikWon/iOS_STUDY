//
//  DataService.swift
//  MVP_Practice
//
//  Created by 원현식 on 2020/11/11.
//

import Foundation

class DataService {
    static func fetchData(completion: (Person?) -> Void) {
        let person = Person(firstName: "Hyunsik", lastName: "Won")
        
        completion(person)
        
    }
}
