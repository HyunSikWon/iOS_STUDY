//
//  AddItemTableViewController.swift
//  Checklist
//
//  Created by 원현식 on 2019/10/19.
//  Copyright © 2019 Hyunsik Won. All rights reserved.
//

import UIKit

protocol ItemDetailViewControllerDelegate : class {
    
    func itemDetailViewControllerDidCancel(_ controller : ItemDetailViewController)
    
    func itemDetailViewController(_ controller : ItemDetailViewController, didFinishAdding item : CheckListItem)
    
    func itemDetailViewController(_sender : ItemDetailViewController, didFinishEditing item : CheckListItem)
}

class ItemDetailViewController: UITableViewController {
    
    weak var delegate : ItemDetailViewControllerDelegate?
    weak var todolist : TodoList?
    weak var itemToEdit : CheckListItem?
    
    @IBOutlet weak var addBarButton: UIBarButtonItem!
    @IBOutlet weak var cancelBarButton: UIBarButtonItem!
    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // itemToEdit이 nil이 아니라는 것은 edit버튼으로 넘어왔다는 뜻. *ChecklistViewController 149줄
        if let item = itemToEdit {
            title = "Edit item"
            textField.text = item.text
            addBarButton.isEnabled = true
        }
        // textField.delegate = self 이렇게 해주거나 sent event – did end on exit -> func done
        navigationItem.largeTitleDisplayMode = .never
        
    }
    
    @IBAction func cancel(_ sender : Any) {
        delegate?.itemDetailViewControllerDidCancel(self)
    }
    
    @IBAction func done(_ sender: Any) {
        if let item = itemToEdit, let text = textField.text {
            item.text = text
            delegate?.itemDetailViewController(_sender: self, didFinishEditing: item)
        } else {
            if let item = todolist?.newTodo() {
                if let textFieldText = textField.text {
                    item.text = textFieldText
                }
                item.checked = false
                delegate?.itemDetailViewController(self, didFinishAdding: item)
            }
        }
    }
    
    //cell에 textfield가 삽입되어 있는 상태에서 textfield가 아닌 cell이 눌러지는 것을 방지하기 위해
    //Return nil if you don't want the row selected.
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        //이전 화면에서 +눌렀을 때 이 화면이 나오자마자 키보드가 나오도록..
        textField.becomeFirstResponder()
    }
    
}

extension ItemDetailViewController : UITextFieldDelegate {
    
    //The text field calls this method whenever the user taps the return button.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // 화면에서 키보드 사라짐
        return false
    }
    
    //The text field calls this method whenever user actions cause its text to change.
    //For example, you could use this method to prevent the user from entering anything but numerical values.
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let oldText = textField.text,
            let stringRange = Range(range, in: oldText ) else {
                return false
        }
        
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        if newText.isEmpty { // Add 버튼 disable default로 해야 동작이 된다.
            addBarButton.isEnabled = false
        } else {
            addBarButton.isEnabled = true
        }
        
        return true
        
    }
    
}
