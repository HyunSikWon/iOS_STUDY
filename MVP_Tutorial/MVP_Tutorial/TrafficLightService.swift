//
//  TrafficLightService.swift
//  MVP_Tutorial
//
//  Created by 원현식 on 2020/11/11.
//

import Foundation

class TrafficLightService {
    func getTrafficLigth(color: String, callBack: (TrafficLight?) -> Void) {
        let trafficLights = [TrafficLight(color: "Red", description: "Stop"),
                            TrafficLight(color: "Green", description: "Go"),
                            TrafficLight(color: "Yellow", description: "About to change to red")
        ]
        
        if let foundTrafficLight = trafficLights.first(where: {$0.color == color}) {
            callBack(foundTrafficLight)
        } else {
            callBack(nil)
        }
    }
}
