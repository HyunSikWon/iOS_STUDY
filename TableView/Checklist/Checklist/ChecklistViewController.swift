//
//  ViewController.swift
//  Checklist
//
//  Created by 원현식 on 03/10/2019.
//  Copyright © 2019 Hyunsik Won. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    
    var todoList : TodoList
    
    // priority를 return해줌 sectionIndex를 받아서.  section의 순서와 priority순서는 같다
    private func priorityForSectionIndex(_ index : Int) -> TodoList.Priority? {
        return TodoList.Priority(rawValue: index)
    }
    
    required init?(coder: NSCoder) {
        todoList = TodoList()
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = editButtonItem
        //편집 모드에서 multi selection 가능하게 선택 동그라미 나옴.
        tableView.allowsMultipleSelectionDuringEditing = true
    }
    
    // Delete버튼의 액션
    @IBAction func deleteItems(_ sender: Any) {
        if let selectedRows = tableView.indexPathsForSelectedRows {
            for indexPath in selectedRows {
                if let priority = priorityForSectionIndex(indexPath.section){ // 우선순위로 section을 나눔
                    let todos = todoList.todoList(for: priority)
                    
                    // 이해할 것.
                    let rowToDelete = indexPath.row > todos.count - 1 ? todos.count - 1 : indexPath.row
                    
                    let item = todos[rowToDelete]
                    
                    todoList.remove(item, for: priority, at: rowToDelete)
                }
            }
            tableView.beginUpdates()
            tableView.deleteRows(at: selectedRows, with: .automatic)
            tableView.endUpdates()
        }
    }
    
    // 편집모드를 위해 필요..
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: true)
        
        tableView.setEditing(tableView.isEditing, animated: true)
        
    }
    
    // table의 row를 결정
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //section에 해당하는 목록의 갯수를 구함
        if let priority = priorityForSectionIndex(section) {
            return todoList.todoList(for: priority).count
        }
        return 0
    }
    
    // cell 설정.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        if let priority = priorityForSectionIndex(indexPath.section) {
            let items = todoList.todoList(for: priority)
            let item = items[indexPath.row]
            configureText(for: cell, with: item)
            configureCheckmark(for: cell, with: item)
        }
        
        return cell
    }
    
    // cell이 선택되었을 때 call 되는 method
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //편집 모드에는 checkMark가 check되지 않게
        if tableView.isEditing {
            return
        }
        if let cell = tableView.cellForRow(at: indexPath) {
            if let priority = priorityForSectionIndex(indexPath.section) {
                let items = todoList.todoList(for: priority)
                let item = items[indexPath.row]
                item.toggleChecked() //isChecked = !isChecked 아님
                configureCheckmark(for: cell, with: item)
                // cell 선택되고 선택이 풀리게.. -> hover 같은 것.
                tableView.deselectRow(at: indexPath, animated: true)
            }
            
        }
    }
    
    // swipe delete를 위해 필요함
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //model에서 제거
        if let priority = priorityForSectionIndex(indexPath.section){
            let item = todoList.todoList(for: priority)[indexPath.row]
            todoList.remove(item, for: priority, at: indexPath.row)
            
            //view에서 제거
            let indexPaths = [indexPath]
            tableView.deleteRows(at: indexPaths, with: .automatic)
        }
        
    }
    
    
    // 편집 모드에서 view에서 cell 이동할 수 있게 해줌 세줄 모양 우측에 생김.
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        // 몇번 section 몇번째 row에서 몇번 section 몇번째 row로 보낼지..
        if let sourcePriority = priorityForSectionIndex(sourceIndexPath.section),
            let destinationPriority = priorityForSectionIndex(destinationIndexPath.section) {
            
            let item = todoList.todoList(for: sourcePriority)[sourceIndexPath.row]
            
            todoList.move(item: item, from: sourcePriority, at: sourceIndexPath.row, to: destinationPriority, at: destinationIndexPath.row)
        }
        
                  tableView.reloadData()
    }
    
    
    func configureText(for cell : UITableViewCell, with item : CheckListItem){
        if let checklistCell = cell as? ChecklistTableViewCell {
            checklistCell.todoTextLabel.text = item.text
        }
    }
    
    func configureCheckmark(for cell : UITableViewCell, with item : CheckListItem ){
        guard let checkMarkCell = cell as? ChecklistTableViewCell else {
            return
        }
        if item.checked {
            checkMarkCell.checkMarkLabel.text = "√"
        } else {
            checkMarkCell.checkMarkLabel.text = ""
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddItemSegue" {
            if let itemDetailViewController = segue.destination as? ItemDetailViewController {
                itemDetailViewController.delegate = self
                itemDetailViewController.todolist = todoList
                
            }
        } else if segue.identifier == "EditItem" {
            if let itemDetailViewController = segue.destination as? ItemDetailViewController {
                if let cell = sender as? UITableViewCell,
                    let indexPath = tableView.indexPath(for: cell),
                    let priority = priorityForSectionIndex(indexPath.section) {
                    let item = todoList.todoList(for: priority)[indexPath.row]
                    itemDetailViewController.itemToEdit = item
                    itemDetailViewController.delegate = self
                }
            }
        }
        
    }
    
    //section의 수. ex) return 2 하면 section 2개만 보임.
    override func numberOfSections(in tableView: UITableView) -> Int {
        return TodoList.Priority.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title : String? = nil
        if let priority = priorityForSectionIndex(section){
            switch priority {
            case .high: title = "High Priority Todos"
            case .medium: title = "Medium Priority Todos"
            case .low: title = "Low Priority Todos"
            case .no: title = "Someday Todo Items"
            }
        }
        return title
        
    }
}

extension ChecklistViewController : ItemDetailViewControllerDelegate {
        
        func itemDetailViewControllerDidCancel(_ controller: ItemDetailViewController) {
            navigationController?.popViewController(animated: true)
        }
        // 아이템 추가 delegate
        func itemDetailViewController(_ controller: ItemDetailViewController, didFinishAdding item: CheckListItem) {
            navigationController?.popViewController(animated: true)
            //ADD default는 medium priority
            let rowIndex = todoList.todoList(for: .medium).count - 1
            let indexPath = IndexPath(row: rowIndex, section: TodoList.Priority.medium.rawValue)
            let indexPaths = [indexPath]
            
            tableView.insertRows(at: indexPaths, with: .automatic)
            
        }
        
        // 아이템 편집 delegate
        func itemDetailViewController(_sender: ItemDetailViewController, didFinishEditing item: CheckListItem) {
            
            for priority in TodoList.Priority.allCases {
                let currentList = todoList.todoList(for: priority)
                if let index = currentList.firstIndex(of: item){ // 수정할 item이 어느 섹션 것인지 아는 과정
                    let indexPath = IndexPath(row: index, section: priority.rawValue)
                    if let cell = tableView.cellForRow(at: indexPath){
                        configureText(for: cell, with: item)
                    }
                }
            }
            navigationController?.popViewController(animated: true)
        }
        
}
