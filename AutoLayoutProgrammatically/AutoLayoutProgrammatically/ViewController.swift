//
//  ViewController.swift
//  AutoLayoutProgrammatically
//
//  Created by 원현식 on 2020/09/16.
//  Copyright © 2020 Hyunsik Won. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var myView: UIView = {
        let v = UIView()
        v.backgroundColor = .red
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
        
    }()
    
    lazy var yourView: UIView = {
        let v = UIView()
        v.backgroundColor = .red
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myView)
        view.addSubview(yourView)
        
        // NSLayoutAnchor
        let margins = view.layoutMarginsGuide
    
//        myView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
//        myView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
//        myView.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
//        myView.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
        
        // NSLayoutConstraint
//        NSLayoutConstraint(item: myView, attribute: .leading, relatedBy: .equal, toItem: margins, attribute: .leading, multiplier: 1.0, constant: 0.0).isActive = true
//         NSLayoutConstraint(item: myView, attribute: .trailing, relatedBy: .equal, toItem: margins, attribute: .trailing, multiplier: 1.0, constant: 0.0).isActive = true
//         NSLayoutConstraint(item: myView, attribute: .top, relatedBy: .equal, toItem: margins, attribute: .top, multiplier: 1.0, constant: 0.0).isActive = true
//         NSLayoutConstraint(item: myView, attribute: .bottom, relatedBy: .equal, toItem: margins, attribute: .bottom, multiplier: 1.0, constant: 0.0).isActive = true
        

    }


}

