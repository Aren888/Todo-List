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
    
    init(title: String, isComplete: Bool = false) {
        self.title = title
        self.isComplete = isComplete
    }
    
    func completeToggled() -> Todo {
        return Todo(title: title, isComplete: !isComplete)
    }
}
