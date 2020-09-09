//
//  ViewController.swift
//  Singleton Practice
//
//  Created by 원현식 on 2020/03/31.
//  Copyright © 2020 Hyunsik Won. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var ageTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func SetDataToSingleton(_ sender: Any) {
        UserInformation.shared.name = nameTextField.text
        UserInformation.shared.age = ageTextField.text
    }
    

}

