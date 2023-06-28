//
//  AddTodoViewController.swift
//  Todo-List
//
//  Created by Aren Musayelyan on 27.06.23.
//

import UIKit

class AddTodoViewController: UIViewController {
    
    // MARK: - UI Components
    
    @IBOutlet weak var task1: UITextField!
    @IBOutlet weak var task2: UITextField!
    @IBOutlet weak var task3: UITextField!
    
    @IBOutlet weak var imageConstraint1: NSLayoutConstraint!
    @IBOutlet weak var imageConstraint2: NSLayoutConstraint!
    
    @IBOutlet weak var labelConstraint1: NSLayoutConstraint!
    @IBOutlet weak var labelConstraint2: NSLayoutConstraint!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        keyboardNotificationSetUp()
        setupUiComponents()
        dismissKeyboardTapGesture()
    }
    
    // MARK: - Keyboard Notifications
    
    private func keyboardNotificationSetUp() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        UIView.animate(withDuration: 0.3) {
            self.labelConstraint1.constant = 40
            self.imageConstraint1.constant = 170
            self.labelConstraint2.constant = 30
            self.imageConstraint2.constant = 40
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        UIView.animate(withDuration: 0.3) {
            self.labelConstraint1.constant = -30
            self.imageConstraint1.constant = 120
            self.labelConstraint2.constant = 20
            self.imageConstraint2.constant = 15
            self.view.layoutIfNeeded()
        }
    }
    
    // MARK: - Dismiss Keyboard
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // MARK: - @IBAction
    
    @IBAction func addToList(_ sender: Any) {
        // Push DashboardViewController onto the navigation stack
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "DashboardViewControllerID") as? DashboardViewController else { return }
        
        if let task1 = task1.text, !task1.isEmpty {
            vc.todos.append(Todo(title: task1))
        }
        if let task2 = task2.text, !task2.isEmpty {
            vc.todos.append(Todo(title: task2))
        }
        if let task3 = task3.text, !task3.isEmpty {
            vc.todos.append(Todo(title: task3))
        }
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - UI Setup
    
    private func setupUiComponents() {
        customSetupUITextField(textField: task1)
        customSetupUITextField(textField: task2)
        customSetupUITextField(textField: task3)
        
        func customSetupUITextField(textField: UITextField) {
            textField.clipsToBounds = true
            textField.layer.cornerRadius = textField.frame.size.height / 3
            textField.setLeftPaddingPoints(10)
        }
    }
    
    // MARK: - Dismiss Keyboard
    
    private func dismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    // MARK: - Deinitialization
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
