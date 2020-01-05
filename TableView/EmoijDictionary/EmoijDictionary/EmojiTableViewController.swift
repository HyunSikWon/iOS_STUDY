//
//  EmojiTableViewController.swift
//  EmoijDictionary
//
//  Created by 원현식 on 2020/01/02.
//  Copyright © 2020 Hyunsik Won. All rights reserved.
//

import UIKit

class EmojiTableViewController: UITableViewController {
    
    var emojis : [Emoji] = [
        Emoji(symbol: "😀", name: "Grinning Face", description: "A typical smiley face.", usage: "happiness"),
        Emoji(symbol: "😕", name: "Confused face", description: "A confused, puzzled face.", usage: "unsure what to think; displeasure"),
        Emoji(symbol: "😍", name: "Heart Eyes", description: "A smiley face with hearts for eyes.", usage: "love of something; attractive"),
        Emoji(symbol: "👮‍♀️", name: "Police officer", description: "A police officer wearing a blue cap with a gold badge.", usage: "person of authority"),
        Emoji(symbol: "🐢", name: "Turtle", description: "A cute turtle.", usage: "Something slow"),
        Emoji(symbol: "🐘", name: "Elephant", description: "A gray elephant.", usage: "good memory"),
        Emoji(symbol: "🍝", name: "Spaghetti", description: "A plate of spaghetti.", usage: "spaghetti"),
        Emoji(symbol: "🎲", name: "Die", description: "A single die.", usage: "taking a risk, chance; game"),
        Emoji(symbol: "⛺️", name: "Tent", description: "A small tent.", usage: "camping"),
        Emoji(symbol: "📚", name: "Book", description: "Three colored books stacked on each other.", usage: "homework, studying"),
        Emoji(symbol: "💔", name: "Broken heart", description: "A red, broken heart.", usage: "extreme sadness"),
        Emoji(symbol: "💤", name: "Snore", description: "Three blue \'z\'s.", usage: "tired, sleepiness"),
        Emoji(symbol: "🏁", name: "Checkered Flag", description: "A black-and-white checkered flag", usage: "completion")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
        navigationController?.navigationBar.prefersLargeTitles = true

    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojis.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Step 1: Dequeue Cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath) as! EmojiTableViewCell
        
        // Step 2: Fetch model object to display
        let emoji = emojis[indexPath.row]
        
        // Step 3: Configure Cell
        cell.update(with : emoji)
        cell.showsReorderControl = true
        
        // Step 4: Return Cell
        return cell
        
    }
    
    // MARK: - Table view Delegate
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedEmoji = emojis.remove(at: sourceIndexPath.row)
        emojis.insert(movedEmoji, at: destinationIndexPath.row)
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            emojis.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditEmoji" {
            let indexPath = tableView.indexPathForSelectedRow!
            let emoji = emojis[indexPath.row]
            
            let navController = segue.destination as! UINavigationController
            let addEditEmojiTableViewController = navController.topViewController as! AddEditEmojiTableViewController
            
            addEditEmojiTableViewController.emoji = emoji
            
        }
    }
    
    @IBAction func unwindToEmojiTableViewController(segue : UIStoryboardSegue) {
        guard segue.identifier == "saveUnwind", // save가 아니라 cancel이면 그냥 return
            let sourceViewController = segue.source as? AddEditEmojiTableViewController,
            let emoji = sourceViewController.emoji else { return }
        
        // 기존 row 수정
        if let selectedRow = tableView.indexPathForSelectedRow {
            emojis[selectedRow.row] = emoji
            tableView.reloadRows(at: [selectedRow], with: .none)
            
        // 새로운 row 추가
        } else {
            let newIndexPath = IndexPath(row: emojis.count, section: 0)
            emojis.append(emoji)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
        
        
    }
}
