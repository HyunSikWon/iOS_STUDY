//
//  SecondViewController.swift
//  LifeCycle
//
//  Created by 원현식 on 2020/01/10.
//  Copyright © 2020 Hyunsik Won. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
           super.viewDidLoad()
           print("SecondViewController - View Did Load")
       }
       
       override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           print("SecondViewController - View Will Appear")
       }
       
       override func viewDidAppear(_ animated: Bool) {
           super.viewDidAppear(animated)
           print("SecondViewController - View Did Appear")
       }
       
       override func viewWillDisappear(_ animated: Bool) {
           super.viewWillDisappear(animated)
           print("SecondViewController - View Will Disappear")
       }
       
       override func viewDidDisappear(_ animated: Bool) {
           super.viewDidDisappear(animated)
           print("SecondViewController - View Did Disppear")
       }

}
