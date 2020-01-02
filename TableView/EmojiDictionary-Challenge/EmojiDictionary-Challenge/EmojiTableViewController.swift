//
//  EmojiTableViewController.swift
//  EmojiDictionary-Challenge
//
//  Created by 원현식 on 2020/01/02.
//  Copyright © 2020 Hyunsik Won. All rights reserved.
//

import UIKit

class EmojiTableViewController: UITableViewController {
    
    var emojis : [[Emoji]] = [
        [ Emoji(symbol: "😀", name: "Grinning Face", description: "A typical smiley face.", usage: "happiness"),
          Emoji(symbol: "😕", name: "Confused face", description: "A confused, puzzled face.", usage: "unsure what to think; displeasure"),
          Emoji(symbol: "😍", name: "Heart Eyes", description: "A smiley face with hearts for eyes.", usage: "love of something; attractive"),
          Emoji(symbol: "👮‍♀️", name: "Police officer", description: "A police officer wearing a blue cap with a gold badge.", usage: "person of authority")],
        
        [Emoji(symbol: "🐢", name: "Turtle", description: "A cute turtle.", usage: "Something slow"),
         Emoji(symbol: "🐘", name: "Elephant", description: "A gray elephant.", usage: "good memory")],
        
        [Emoji(symbol: "🍝", name: "Spaghetti", description: "A plate of spaghetti.", usage: "spaghetti")],
        
        [Emoji(symbol: "🎲", name: "Die", description: "A single die.", usage: "taking a risk, chance; game")],
        
        [Emoji(symbol: "⛺️", name: "Tent", description: "A small tent.", usage: "camping")],
        
        [Emoji(symbol: "📚", name: "Book", description: "Three colored books stacked on each other.", usage: "homework, studying")],
        
        [Emoji(symbol: "💔", name: "Broken heart", description: "A red, broken heart.", usage: "extreme sadness"),
         Emoji(symbol: "💤", name: "Snore", description: "Three blue \'z\'s.", usage: "tired, sleepiness")],
        
        [Emoji(symbol: "🏁", name: "Checkered Flag", description: "A black-and-white checkered flag", usage: "completion")]
    ]
    
    private func sectionForSectionIndex(_ index : Int) -> Emoji.Section? {
        return Emoji.Section(rawValue: index)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return Emoji.Section.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title : String? = nil
        if let section = sectionForSectionIndex(section) {
            switch section {
            case .SmileysPeople: title = "Smileys&People"
            case .AnimalsNature: title = "Animals&Nature"
            case .FoodDrink: title = "Food&Drink"
            case .Acitivty: title = "Acitivty"
            case .TravlePlaces: title = "Travle&Places"
            case .Objects: title = "Objects"
            case .Symbols: title = "Symbols"
            case .Flags : title = "Flags"
                
            }
        }
        return title
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojis[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath)
        
        cell.textLabel?.text = "\(emojis[indexPath.section][indexPath.row].symbol) - \(emojis[indexPath.section][indexPath.row].name)"
        cell.detailTextLabel?.text = "\(emojis[indexPath.section][indexPath.row].description)"
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    
    
    
    
}
