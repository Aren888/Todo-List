//
//  SignUpViewController.swift
//  Todo-List
//
//  Created by Aren Musayelyan on 27.06.23.
//

import UIKit

class SignUpViewController: UIViewController {
    
    // MARK: - UI Components
    @IBOutlet weak var fullName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    
    @IBOutlet weak var signInLabel: UILabel!
    
    @IBOutlet weak var constraintsTextField: NSLayoutConstraint!
    @IBOutlet weak var constraintLabel1: NSLayoutConstraint!
    @IBOutlet weak var constraintLabel2: NSLayoutConstraint!
    
    lazy var signInViewController: SignInViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "SignInViewControllerID") as! SignInViewController
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUiComponents()
        dismissKeyboardTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addObserverForKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeObserverForKeyboardNotifications()
    }
    
    // MARK: - @objc Functions
    @objc func keyboardWillHide(_ notification: Notification) {
        UIView.animate(withDuration: 0.3) {
            self.constraintsTextField.constant = 60
            self.constraintLabel1.constant = 60
            self.constraintLabel2.constant = 20
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        UIView.animate(withDuration: 0.3) {
            self.constraintsTextField.constant = 20
            self.constraintLabel1.constant = -20
            self.constraintLabel2.constant = 20
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func signInLabelTapped(_ sender: UITapGestureRecognizer) {
        navigationController?.pushViewController(signInViewController, animated: true)
    }
    
    @objc func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    // MARK: - @IBAction
    @IBAction func signUp(_ sender: Any) {
        navigationController?.pushViewController(signInViewController, animated: true)
    }
    
    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - UI Setup
    private func setupUiComponents() {
        customSetupUITextField(textField: fullName)
        customSetupUITextField(textField: email)
        customSetupUITextField(textField: password)
        customSetupUITextField(textField: confirmPassword)
        
        func customSetupUITextField(textField: UITextField) {
            textField.clipsToBounds = true
            textField.layer.cornerRadius = textField.frame.size.height / 3
            textField.setLeftPaddingPoints(10)
        }
        
        // TODO: - Aetup Label Tap
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.signInLabelTapped(_:)))
        signInLabel.isUserInteractionEnabled = true
        signInLabel.addGestureRecognizer(labelTap)
    }
    
    // TODO: - Dismiss Keyboard
    private func dismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    private func addObserverForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func removeObserverForKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

// MARK: - Extensions
extension UITextField {
    func setLeftPaddingPoints(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
