//
//  TodoList.swift
//  Checklist
//
//  Created by 원현식 on 2019/10/17.
//  Copyright © 2019 Hyunsik Won. All rights reserved.
//

import Foundation

class TodoList {
    
    //    var todos : [CheckListItem
    //CaseIterable는 모든 case에 접근하게..?
    enum Priority : Int, CaseIterable {
        case high,medium,low,no
    }
    
    //우선순위에 따란 리스트 배열
    var highPriorityTodos : [CheckListItem] = []
    var mediumPriorityTodos : [CheckListItem] = []
    var lowPriorityTodos : [CheckListItem] = []
    var noPriorityTodos : [CheckListItem] = []
    
    
    init() {
        let row0Item = CheckListItem()
        let row1Item = CheckListItem()
        let row2Item = CheckListItem()
        let row3Item = CheckListItem()
        let row4Item = CheckListItem()
        
        row0Item.text = "Take a Jog"
        row1Item.text = "Watch a movie"
        row2Item.text = "Code an app"
        row3Item.text = "Walk the dog"
        row4Item.text = "Study design patterns"
        
        // default는 medium
        addTodo(row0Item, for: .medium)
        addTodo(row1Item, for: .low)
        addTodo(row2Item, for: .high)
        addTodo(row3Item, for: .no)
        addTodo(row4Item, for: .high)
        
        
    }
    
    //우선순위를 받아서 해당 배열에 add
    func addTodo(_ item : CheckListItem, for priority : Priority, at index : Int = -1) {
        switch priority {
        case .high:
            if index < 0 {
                highPriorityTodos.append(item)
            } else {
                highPriorityTodos.insert(item, at: index)
            }
        case .medium:
            if index < 0 {
                mediumPriorityTodos.append(item)
            } else {
                mediumPriorityTodos.insert(item, at: index)
            }
        case .low:
            if index < 0 {
                lowPriorityTodos.append(item)
            } else {
                lowPriorityTodos.insert(item, at: index)
            }
        case .no:
            if index < 0 {
                noPriorityTodos.append(item)
            } else {
                noPriorityTodos.insert(item, at: index)
            }
        }
    }
    
    // 우선순위에 해당하는 리스트 얻기
    func todoList(for priority : Priority) -> [CheckListItem] {
        switch priority {
        case .high:
            return highPriorityTodos
        case .medium:
            return mediumPriorityTodos
        case .low:
            return lowPriorityTodos
        case .no:
            return noPriorityTodos
        }
    }
    
    
    func newTodo() -> CheckListItem {
        let item = CheckListItem()
        item.text = self.randomTitle()
        item.checked = true
        
        //default는 medium
        mediumPriorityTodos.append(item)
        
        return item
    }
    
    func move(item : CheckListItem, from sourcePriority : Priority, at sourceIndex : Int, to destinationPriority : Priority, at destinationIndex : Int){
        
        remove(item, for: sourcePriority, at: sourceIndex)
        addTodo(item, for: destinationPriority, at: destinationIndex)
        
    }
    
    // 원하는 우선순위에 몇번 째 데이터 삭제
    func remove(_ item : CheckListItem, for priority : Priority, at index : Int) {
        switch priority {
        case .high:
            highPriorityTodos.remove(at: index)
        case .medium:
            mediumPriorityTodos.remove(at: index)
        case .low:
            lowPriorityTodos.remove(at: index)
        case .no:
            noPriorityTodos.remove(at: index)
        }
    }
    
    private func randomTitle() -> String {
        
        let titles = [ "New todo item", "Generic todo","Fill me out", "I need something todo", "Much todo about nothing" ]
        
        let randomNumber = Int.random(in: 0...titles.count-1)
        
        return titles[randomNumber]
        
    }
}
