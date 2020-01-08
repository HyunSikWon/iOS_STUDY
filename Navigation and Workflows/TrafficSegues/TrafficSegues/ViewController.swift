//
//  ViewController.swift
//  TrafficSegues
//
//  Created by 원현식 on 2020/01/08.
//  Copyright © 2020 Hyunsik Won. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet var textField : UITextField!
    
    @IBAction func unwindToRed(unwindSegue : UIStoryboardSegue) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.navigationItem.title = textField.text
        textField.text = ""
    }


}

