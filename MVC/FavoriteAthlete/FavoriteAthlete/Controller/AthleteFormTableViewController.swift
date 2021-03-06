//
//  AthleteFormViewController.swift
//  FavoriteAthlete
//
//  Created by 원현식 on 2020/01/11.
//  Copyright © 2020 Hyunsik Won. All rights reserved.
//

import UIKit

class AthleteFormTableViewController: UITableViewController {
    
    var athlete : Athlete?
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var ageTextField: UITextField!
    @IBOutlet var leagueTextField: UITextField!
    @IBOutlet var teamTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let athlete = athlete {
            nameTextField.text = athlete.name
            ageTextField.text = athlete.age
            leagueTextField.text = athlete.league
            teamTextField.text = athlete.team

        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard segue.identifier == "SaveUnwind" else { return }
        
        let name = nameTextField.text ?? ""
        let age = ageTextField.text ?? ""
        let league = leagueTextField.text ?? ""
        let team = teamTextField.text ?? ""
        
        athlete = Athlete(name: name, age: age, team: team, league: league)
        
    }
    
}
