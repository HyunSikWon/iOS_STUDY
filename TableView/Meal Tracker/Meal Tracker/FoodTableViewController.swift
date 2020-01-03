//
//  FoodTableViewController.swift
//  Meal Tracker
//
//  Created by 원현식 on 2020/01/02.
//  Copyright © 2020 Hyunsik Won. All rights reserved.
//

import UIKit

class FoodTableViewController: UITableViewController {
    
    var meals : [Meal] = [
        Meal(name: "breakfast", food:[Food(name: "빵", description: "소시지 빵"), Food(name: "우유", description: "초코 우유")] ),
        Meal(name: "lunch", food: [Food(name: "소고기", description: "한우"), Food(name: "김치",description: "반찬")] ),
        Meal(name : "dinner", food: [Food(name: "샐러드", description: "다이어트 식단")])
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return meals.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return meals[section].food.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell",for: indexPath)
        
        cell.textLabel?.text = meals[indexPath.section].food[indexPath.row].name
        cell.detailTextLabel?.text = meals[indexPath.section].food[indexPath.row].description
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return meals[section].name
    }

}

