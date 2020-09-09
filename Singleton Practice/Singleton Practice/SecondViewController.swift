//
//  SecondViewController.swift
//  Singleton Practice
//
//  Created by 원현식 on 2020/03/31.
//  Copyright © 2020 Hyunsik Won. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = UserInformation.shared.name
        ageLabel.text = UserInformation.shared.age

      
    }
    


}
