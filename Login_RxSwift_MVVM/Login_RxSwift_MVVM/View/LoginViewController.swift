//
//  ViewController.swift
//  Login_RxSwift_MVVM
//
//  Created by 원현식 on 2020/11/12.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {
    
    
    // viewModel
    let viewModel = LoginViewModel()
    var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        bindUI()
    }
    
    private func bindUI() {
    // Input: 2
        // email
        idField.rx.text.orEmpty
            .bind(to: viewModel.emailText)
        .disposed(by: disposeBag)
        
        // password
        pwField.rx.text.orEmpty
            .bind(to: viewModel.passwordText)
            .disposed(by: disposeBag)
        
    // OUTUPT: 3
        // Email Valid
        viewModel.isEmailValid
            .bind(to: idValidView.rx.isHidden)
            .disposed(by: disposeBag)
        // Password Valid
        viewModel.isPasswordValid
            .bind(to: pwValidView.rx.isHidden)
            .disposed(by: disposeBag)
        
        // Button Enable
        Observable.combineLatest(viewModel.isEmailValid, viewModel.isPasswordValid) { $0 && $1 }
            .bind(to: loginButton.rx.isEnabled)
            .disposed(by: disposeBag)
            
    }
    
    // IBOutlet
    @IBOutlet var idField: UITextField!
    @IBOutlet var pwField: UITextField!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var idValidView: UIView!
    @IBOutlet var pwValidView: UIView!

}

