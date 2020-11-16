//
//  LoginViewModel.swift
//  Login_RxSwift_MVVM
//
//  Created by 원현식 on 2020/11/12.
//

import Foundation
import RxSwift

class LoginViewModel {
    
    let emailText = BehaviorSubject<String>(value: "")
    let passwordText = BehaviorSubject<String>(value: "")

    var isEmailValid = BehaviorSubject<Bool>(value: false)
    var isPasswordValid = BehaviorSubject<Bool>(value: false)
    
    init() {
        _ = emailText.distinctUntilChanged()
            .map(checkEmailValid)
            .bind(to: isEmailValid)
        
        _ = passwordText.distinctUntilChanged()
            .map(checkPasswordValid)
            .bind(to: isPasswordValid)
        
    }
    
    // Logic
    private func checkEmailValid(_ email: String) -> Bool {
        return email.contains("@") && email.contains(".")
    }

    private func checkPasswordValid(_ password: String) -> Bool {
        return password.count > 5
    }
}
