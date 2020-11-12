//
//  GreetingViewModel.swift
//  MVVM_Practice
//
//  Created by 원현식 on 2020/11/12.
//

import Foundation

class GreetingViewModel {
    var model: Person
    
    var greeting: String? {
        didSet {
            self.greetingDidChange?(self)
        }
    }
    
    var greetingDidChange: ((GreetingViewModel) -> ())?
    
    init() {
        self.model = Person(firstName: "HS", lastName: "Won")
    }
    
    func showGreeting() {
        self.greeting = "Hello \(model.firstName) \(model.lastName)"
    }
    
}
