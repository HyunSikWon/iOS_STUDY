//
//  ViewController.swift
//  MVC_Practice
//
//  Created by 원현식 on 2020/11/11.
//

import UIKit

// View + ViewController
class GreetingViewController: UIViewController {
    
    let model: Person = Person(firstName: "Hyunsik", lastName: "Won")

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func tapShowButton(_ sender: Any) {
        let greeting = "Hello \(model.firstName) \(model.lastName)"
        greetingLabel.text = greeting
    }
    
    // IBOutlet
    @IBOutlet weak var greetingLabel: UILabel!

}

