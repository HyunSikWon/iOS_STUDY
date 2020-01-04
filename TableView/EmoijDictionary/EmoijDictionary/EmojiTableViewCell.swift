//
//  EmojiTableViewCell.swift
//  EmoijDictionary
//
//  Created by 원현식 on 2020/01/04.
//  Copyright © 2020 Hyunsik Won. All rights reserved.
//

import UIKit

class EmojiTableViewCell: UITableViewCell {

    @IBOutlet var symbolLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    func update(with emoji : Emoji) {
        symbolLabel.text = emoji.symbol
        nameLabel.text = emoji.name
        descriptionLabel.text = emoji.description
    }
    
}
