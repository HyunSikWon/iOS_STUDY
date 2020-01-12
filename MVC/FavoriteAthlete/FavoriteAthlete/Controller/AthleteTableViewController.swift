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
        navigationItem.leftBarButtonItem = editButtonItem
        navigationController?.navigationBar.prefersLargeTitles = true
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
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            athletes.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedAthlete = athletes.remove(at: sourceIndexPath.row)
        athletes.insert(movedAthlete, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow,
            segue.identifier == "EditAthlete" {
            let navController = segue.destination as! UINavigationController
            let athleteFormTableViewController = navController.topViewController as! AthleteFormTableViewController
            
            athleteFormTableViewController.athlete = athletes[indexPath.row]
        }
    }
    
    @IBAction func unwindToList(segue : UIStoryboardSegue) {
        guard segue.identifier == "SaveUnwind",
            let sourceViewController = segue.source as? AthleteFormTableViewController,
            let athlete = sourceViewController.athlete else { return }
        
        if let seletedRow = tableView.indexPathForSelectedRow {
            athletes[seletedRow.row] = athlete
            tableView.reloadRows(at: [seletedRow], with: .none)
        } else {
            let newIndexPath = IndexPath(row: athletes.count, section: 0)
            athletes.append(athlete)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
         
        
    }
    
    
    
    
    


}
