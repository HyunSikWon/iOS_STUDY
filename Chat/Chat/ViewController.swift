//
//  ViewController.swift
//  Chat
//
//  Created by 원현식 on 2020/05/26.
//  Copyright © 2020 Hyunsik Won. All rights reserved.
//

import UIKit

struct ChatMessage {
    let text: String
    let isIncoming: Bool
}

class ViewController: UIViewController {
    
    fileprivate let cellID = "id"
    @IBOutlet var tableView: UITableView!
    @IBOutlet var bottomConstraint: NSLayoutConstraint!
    @IBOutlet var messageTextView: UITextView!
    
    var chatMessages = [
        ChatMessage(text: "첫 message app", isIncoming: true),
        ChatMessage(text: "I'm going to message another long message that will word wrap", isIncoming: true),
        ChatMessage(text: "I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap", isIncoming: false),
        ChatMessage(text: "첫 message app", isIncoming: false),
        ChatMessage(text: "11111 message app", isIncoming: false),
        ChatMessage(text: "첫 222222 2message app", isIncoming: true),
        ChatMessage(text: "첫 message app", isIncoming: true),
        ChatMessage(text: "11111 message app", isIncoming: false),
        ChatMessage(text: "첫 222222 2message app", isIncoming: true),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: cellID)
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        addKeyboardNotification()
         messageTextView.delegate = self
        messageTextView.layer.cornerRadius = 12
  
    }
    
    func addKeyboardNotification() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
        
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        guard let keyboardFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        bottomConstraint.constant = keyboardFrame.height - 16
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        bottomConstraint.constant = 0
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatMessages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ChatMessageCell
        let chatMessage = chatMessages[indexPath.row]
        cell.chatMessage = chatMessage
        return cell
    }
}

extension ViewController: UITextViewDelegate {
  func textViewDidChange(_ textView: UITextView) {
    let size = CGSize(width: textView.frame.width, height: .infinity)
    let estimatedSize = textView.sizeThatFits(size)
    textView.constraints.forEach { (constraint) in
         if constraint.firstAttribute == .height {
            if estimatedSize.height < 80 {
                constraint.constant = estimatedSize.height
            }
      }
    }
  }
}

