//
//  GreetingViewPresenter.swift
//  MVP_Practice
//
//  Created by 원현식 on 2020/11/11.
//

import Foundation


protocol GreetingView: class {
    func setGreeting(greeting: String)
}

// Presenter
class GreetingPresenter{
    // Model
    var person: Person = Person(firstName: "HS", lastName: "Won")
    // View
    unowned let view: GreetingView

    init(view: GreetingView) {
        self.view = view
    }
    
    func showGreeting() {
        let greeting = "Hello \(person.firstName) \(person.lastName)"
        view.setGreeting(greeting: greeting)
    }
    
}
