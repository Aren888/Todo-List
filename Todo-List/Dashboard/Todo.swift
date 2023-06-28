//
//  Todo.swift
//  Todo-List
//
//  Created by Aren Musayelyan on 28.06.23.
//

import Foundation

struct Todo {
    let title: String
    let isComplete: Bool
    
    // Initialize a Todo item with a title and completion status (default is false)
    init(title: String, isComplete: Bool = false) {
        self.title = title
        self.isComplete = isComplete
    }
    
    // Toggle the completion status of the Todo item and return a new Todo item
    func completeToggled() -> Todo {
        return Todo(title: title, isComplete: !isComplete)
    }
}
