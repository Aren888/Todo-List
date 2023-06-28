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
        save.layer.cornerRadius = 15
        textfield.text = todo?.title
    }
    
    @IBAction func save(_ sender: Any) {
        
        let todo = Todo(title: textfield.text!)
        delegate?.todoViewController(self, didSaveTodo: todo)
        self.navigationController?.popViewController(animated: true)
    }
}
