//
//  AddEditEmojiTableViewController.swift
//  EmoijDictionary
//
//  Created by 원현식 on 2020/01/05.
//  Copyright © 2020 Hyunsik Won. All rights reserved.
//

import UIKit

class AddEditEmojiTableViewController: UITableViewController {
    

    var emoji: Emoji?
    @IBOutlet var saveButton: UIBarButtonItem!

    @IBOutlet var symbolTextField: UITextField!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var descriptionTextField: UITextField!
    @IBOutlet var usageTextField: UITextField!

    @IBOutlet var saveButton: UIBarButtonItem!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let emoji = emoji {
            title = "Edit Emoji"
            symbolTextField.text = emoji.symbol
            nameTextField.text = emoji.name
            descriptionTextField.text = emoji.description
            usageTextField.text = emoji.usage
        } else {
            title = "Add Emoji"
        }
        
        updateSaveButtonState()
    }
    
    func updateSaveButtonState() {
        let symbolText = symbolTextField.text ?? ""
        let nameText = nameTextField.text ?? ""
        let descriptionText = descriptionTextField.text ?? ""
        let usageText = usageTextField.text ?? ""
        
        saveButton.isEnabled = !symbolText.isEmpty && !nameText.isEmpty && !descriptionText.isEmpty && !usageText.isEmpty
    }
    
    @IBAction func textEditingChanged(_ sender : UITextField) {
        updateSaveButtonState()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        guard segue.identifier == "saveUnwind" else { return }

        let symbol = symbolTextField.text ?? ""
        let name = nameTextField.text ?? ""
        let description = descriptionTextField.text ?? ""
        let usage = usageTextField.text ?? ""
        
        emoji = Emoji(symbol: symbol, name: name, description: description, usage: usage)
    }
     
        
}
