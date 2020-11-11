//
//  ViewController.swift
//  Bounds&Frame
//
//  Created by 원현식 on 2020/09/20.
//  Copyright © 2020 Hyunsik Won. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var containerView: UIView!
    @IBOutlet var subView: UIView!
    
    @IBOutlet var containerViewFrameXLabel: UILabel!
    @IBOutlet var containerViewBoundsXLabel: UILabel!
    
    @IBOutlet var frameSlider: UISlider!
    @IBOutlet var boundsSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        frameSlider.value = Float(containerView.frame.origin.x)
        updatesLabel()

    }
    
    
    @IBAction func frameSliderChanged(_ sender: Any) {
        containerView.frame.origin.x = CGFloat((sender as! UISlider).value)
        
        updatesLabel()

    }
    
    @IBAction func boundsSliderChanged(_ sender: Any) {
        containerView.bounds.origin.x = CGFloat((sender as! UISlider).value)
        
        updatesLabel()
    }
    
    private func updatesLabel() {
         containerViewFrameXLabel.text = "frame x origin = \(Int(frameSlider.value))"
        containerViewBoundsXLabel.text = "bounds x origin = \(Int(boundsSlider.value))"
    }
    
    
}

