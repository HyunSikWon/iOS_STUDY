//
//  UserInformation.swift
//  Singleton Practice
//
//  Created by 원현식 on 2020/03/31.
//  Copyright © 2020 Hyunsik Won. All rights reserved.
//

import Foundation

class UserInformation {
    static let shared: UserInformation = UserInformation()
    
    var name: String?
    var age: String?
}
