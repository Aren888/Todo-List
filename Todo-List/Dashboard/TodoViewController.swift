//
//  TodoViewController.swift
//  Todo-List
//
//  Created by Aren Musayelyan on 28.06.23.
//

import UIKit

protocol TodoViewControllerDelegate: AnyObject {
    func todoViewController(_ vc: TodoViewController, didSaveTodo todo: Todo)
}

class TodoViewController: UIViewController {
    
    @IBOutlet weak var save: UIButton!
    @IBOutlet weak var textfield: UITextField!
    var todo: Todo?
    
    weak var delegate: TodoViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the corner radius for the save button
        save.layer.cornerRadius = 15
        
        // Set the text field's text to the title of the todo
        textfield.text = todo?.title
    }
    
    @IBAction func save(_ sender: Any) {
        // Create a new Todo object with the text field's text as the title
        let todo = Todo(title: textfield.text!)
        
        // Notify the delegate that a todo was saved
        delegate?.todoViewController(self, didSaveTodo: todo)
        
        // Pop the view controller from the navigation stack
        self.navigationController?.popViewController(animated: true)
    }
}
