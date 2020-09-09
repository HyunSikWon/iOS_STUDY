//
//  ViewController.swift
//  CustomTextView
//
//  Created by 원현식 on 2020/09/09.
//  Copyright © 2020 Hyunsik Won. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    var textViewMaxHeight: CGFloat = 0.0
    
    lazy var textView: UITextView = {
        var tv = UITextView()
        tv.backgroundColor = .darkGray
        tv.delegate = self
//        tv.isScrollEnabled = false
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
//        textViewMaxHeight = (textView.font?.lineHeight ?? 30) * 3.0
        
        NSLayoutConstraint.activate([
            textView.widthAnchor.constraint(equalTo: view.widthAnchor),
            textView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            textView.heightAnchor.constraint(equalToConstant: 30),
            textView.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor)
        ])
        
    }
    
}

extension ViewController: UITextViewDelegate {
    // 동적으로 textview 높이 조절
    func textViewDidChange(_ textView: UITextView) { // textview의 text or attributes가 사용자에 의해 변화가 있는 경우
        
        let size = CGSize(width: textView.frame.width, height: .infinity)
        let estimatedSize = textView.sizeThatFits(size)

//        guard estimatedSize.height < textViewMaxHeight else { textView.isScrollEnabled = true; return }
//
//        textView.isScrollEnabled = false
        
        textView.constraints.forEach { (constraint) in
            if constraint.firstAttribute == .height {
                constraint.constant = estimatedSize.height
            }
        }
    }
    
}
