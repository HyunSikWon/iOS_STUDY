//
//  TrafficLightViewController.swift
//  MVP_Tutorial
//
//  Created by 원현식 on 2020/11/11.
//

import UIKit

// View/ViewController
class TrafficLightViewController: UIViewController, TrafficLigthViewDelegate {
    
    // presenter
    private let trafficLigthPresenter: TrafficLigthPresenter = TrafficLigthPresenter(trafficLigthService: TrafficLightService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trafficLigthPresenter.setView(view: self)
    }
    
    // View의 사용자 입력을 Presenter에게 알린다
    @IBAction func redLight(_ sender: Any) {
        trafficLigthPresenter.trafficLightColorSelected(color: "Red")
    }
    
    // View의 사용자 입력을 Presenter에게 알린다
    @IBAction func yellowLight(_ sender: Any) {
        trafficLigthPresenter.trafficLightColorSelected(color: "Yellow")
    }
    
    // View의 사용자 입력을 Presenter에게 알린다
    @IBAction func greenLight(_ sender: Any) {
        trafficLigthPresenter.trafficLightColorSelected(color: "Green")
    }
    
    // Presenter에 의해 업데이트
    func displayTrafficLight(_ description: String) {
        currentStateLabel.text = description
    }
    
    // OUTLETS
    @IBOutlet weak var currentStateLabel: UILabel!
    
}
