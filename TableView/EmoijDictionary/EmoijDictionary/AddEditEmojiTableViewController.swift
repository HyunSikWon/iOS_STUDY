//
//  AddEditEmojiTableViewController.swift
//  EmoijDictionary
//
//  Created by 원현식 on 2020/01/05.
//  Copyright © 2020 Hyunsik Won. All rights reserved.
//

import UIKit

class AddEditEmojiTableViewController: UITableViewController {
    
<<<<<<< Updated upstream
    var emoji: Emoji?
    @IBOutlet var saveButton: UIBarButtonItem!
    
=======
    var emoji : Emoji?
>>>>>>> Stashed changes
    @IBOutlet var symbolTextField: UITextField!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var descriptionTextField: UITextField!
    @IBOutlet var usageTextField: UITextField!
    
<<<<<<< Updated upstream
=======
    @IBOutlet var saveButton: UIBarButtonItem!
    
    
>>>>>>> Stashed changes
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let emoji = emoji {
            title = "Edit Emoji"
            symbolTextField.text = emoji.symbol
            nameTextField.text = emoji.name
            descriptionTextField.text = emoji.description
            usageTextField.text = emoji.usage
<<<<<<< Updated upstream
            
=======
>>>>>>> Stashed changes
        } else {
            title = "Add Emoji"
        }
        
        updateSaveButtonState()
<<<<<<< Updated upstream
        
=======
>>>>>>> Stashed changes
    }
    
    func updateSaveButtonState() {
        let symbolText = symbolTextField.text ?? ""
        let nameText = nameTextField.text ?? ""
        let descriptionText = descriptionTextField.text ?? ""
        let usageText = usageTextField.text ?? ""
        
        saveButton.isEnabled = !symbolText.isEmpty && !nameText.isEmpty && !descriptionText.isEmpty && !usageText.isEmpty
<<<<<<< Updated upstream
        
=======
>>>>>>> Stashed changes
    }
    
    @IBAction func textEditingChanged(_ sender : UITextField) {
        updateSaveButtonState()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
<<<<<<< Updated upstream
        
        guard segue.identifier == "saveUnwind" else { return }
        
=======

        guard segue.identifier == "saveUnwind" else { return }

>>>>>>> Stashed changes
        let symbol = symbolTextField.text ?? ""
        let name = nameTextField.text ?? ""
        let description = descriptionTextField.text ?? ""
        let usage = usageTextField.text ?? ""
<<<<<<< Updated upstream
        
        emoji = Emoji(symbol: symbol, name: name, description: description, usage: usage)
    }
    
    

    

=======

        emoji = Emoji(symbol: symbol, name: name, description: description, usage: usage)
        
    }
>>>>>>> Stashed changes
}
