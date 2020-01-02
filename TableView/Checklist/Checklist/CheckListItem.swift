//
//  CheckListItem.swift
//  Checklist
//
//  Created by 원현식 on 2019/10/08.
//  Copyright © 2019 Hyunsik Won. All rights reserved.
//

import Foundation

class CheckListItem : NSObject {
    
    @objc var text = ""
    var checked = false
    
    func toggleChecked(){
        checked = !checked
    }
    

    
}
