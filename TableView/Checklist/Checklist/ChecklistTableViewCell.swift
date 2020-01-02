//
//  ChecklistTableViewCell.swift
//  Checklist
//
//  Created by 원현식 on 2019/10/22.
//  Copyright © 2019 Hyunsik Won. All rights reserved.
//

import UIKit

class ChecklistTableViewCell: UITableViewCell {

    @IBOutlet weak var checkMarkLabel: UILabel!
    @IBOutlet weak var todoTextLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
