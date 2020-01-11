//
//  AthleteTableViewController.swift
//  FavoriteAthlete
//
//  Created by 원현식 on 2020/01/11.
//  Copyright © 2020 Hyunsik Won. All rights reserved.
//

import UIKit

class AthleteTableViewController: UITableViewController {
    
    var athletes: [Athlete] = [Athlete(name: "Hyunjin-Ryu", age: "32", team: "Blue Jays", league: "MLB"),
                               Athlete(name: "Tyler Wilson", age: "30", team: "LG Twins", league: "KBO")]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return athletes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AthleteCell", for: indexPath)
        
        cell.textLabel?.text = athletes[indexPath.row].name
        cell.detailTextLabel?.text = athletes[indexPath.row].description

        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow,
            segue.identifier == "EditAthlete" {
            let destinationController = segue.destination as? AthleteFormViewController
            destinationController?.athlete = athletes[indexPath.row]
        }
    }
    
    
    
    
    


}
