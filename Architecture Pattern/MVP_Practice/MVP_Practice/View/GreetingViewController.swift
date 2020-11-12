//
//  ViewController.swift
//  MVP_Practice
//
//  Created by 원현식 on 2020/11/11.
//

import UIKit

class GreetingViewController: UIViewController, GreetingView {
    
    // Presenter
    var presenter: GreetingPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = GreetingPresenter(view: self)
    }
    
    // View에서의 입력을 Presenter에게 알림
    @IBAction func tapShowButton(_ sender: Any) {
        presenter?.showGreeting()
    }
    
    // Presenter에 의해 호출
    func setGreeting(greeting: String) {
        greetingLabel.text = greeting
    }
    
    // IBOutlet
    @IBOutlet weak var greetingLabel: UILabel!
    
}

