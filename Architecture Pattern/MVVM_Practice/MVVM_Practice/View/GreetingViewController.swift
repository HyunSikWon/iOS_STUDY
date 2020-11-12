//
//  ViewController.swift
//  MVVM_Practice
//
//  Created by 원현식 on 2020/11/12.
//

import UIKit

class GreetingViewController: UIViewController {
    
    // ViewModel
    var viewModel = GreetingViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.greetingDidChange = { [weak self] vm in
            self?.greetingLabel.text = vm.greeting
        }
        
    }
    
    // ViewModel 호출
    @IBAction func showButton(_ sender: Any) {
        viewModel.showGreeting()
    }
    
    // IBOutlet
    @IBOutlet weak var greetingLabel: UILabel!
    
    
}

