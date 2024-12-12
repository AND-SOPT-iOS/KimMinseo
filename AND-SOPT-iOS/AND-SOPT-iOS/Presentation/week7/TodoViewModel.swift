//
//  TodoViewModel.swift
//  AND-SOPT-iOS
//
//  Created by 김민서 on 12/12/24.
//

import SwiftUI

class TodoViewModel: ObservableObject {
    @Published var todos: [(text: String, isChecked: Bool, time: String?)]
    
    init(todos: [(text: String, isChecked: Bool, time: String?)]) {
        self.todos = todos
    }
    
    func toggleTodoCheck(at index: Int) {
        todos[index].isChecked.toggle()
        
        if todos[index].isChecked {
            let todo = todos.remove(at: index)
            todos.append(todo)
        } else {
            let todo = todos.remove(at: index)
            todos.insert(todo, at: findInsertIndex(for: todo))
        }
    }
    
    private func findInsertIndex(for todo: (text: String, isChecked: Bool, time: String?)) -> Int {
        if let index = todos.firstIndex(where: { !$0.isChecked && $0.text > todo.text }) {
            return index
        }
        return todos.count - 1
    }
    
    func reorderTodos() {
        todos = todos.filter { !$0.isChecked } + todos.filter { $0.isChecked }
    }
}
