//
//  TrafficLightPresenter.swift
//  MVP_Tutorial
//
//  Created by 원현식 on 2020/11/11.
//

import Foundation

protocol TrafficLigthViewDelegate: class {
    func displayTrafficLight(_ description: String)
}

// Presenter
class TrafficLigthPresenter {
    private let trafficLigthService: TrafficLightService // model
    weak private var trafficLightViewdelegate: TrafficLigthViewDelegate? // view
    
    init(trafficLigthService: TrafficLightService ) {
        self.trafficLigthService = trafficLigthService
    }
    
    func setView(view: TrafficLigthViewDelegate ) {
        self.trafficLightViewdelegate = view
    }
    
    // 데이터 변화를 View에게 알림
    func trafficLightColorSelected(color: String) {
        trafficLigthService.getTrafficLigth(color: color) { (trafficLight) in
            guard trafficLight != nil else { return }
            
            trafficLightViewdelegate?.displayTrafficLight(trafficLight!.description)
        }
    }
    
}
