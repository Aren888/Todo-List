//
//  SignInViewController.swift
//  Todo-List
//
//  Created by Aren Musayelyan on 27.06.23.
//

import UIKit

class SignInViewController: UIViewController {
    
    // MARK: - UI Components
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var signUpLabel: UILabel!
    
    @IBOutlet weak var labelConstraints: NSLayoutConstraint!
    @IBOutlet weak var imageConstraintsHeight: NSLayoutConstraint!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signInLabelTapped()
        dismissKeyboardTapGesture()
        keyboardNotificationSetUp()
    }
    
    // MARK: - Keyboard Notification Setup
    
    private func keyboardNotificationSetUp() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK: - Keyboard Notification Handlers
    
    @objc func keyboardWillHide(_ notification: Notification) {
        UIView.animate(withDuration: 0.3) {
            self.labelConstraints.constant = 40
            self.imageConstraintsHeight.constant = 240
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        UIView.animate(withDuration: 0.3) {
            self.labelConstraints.constant = -30
            self.imageConstraintsHeight.constant = 180
            self.view.layoutIfNeeded()
        }
    }
    
    // MARK: - SignIn Label Tapped
    
    private func signInLabelTapped() {
        customSetupUITextField(textField: email)
        customSetupUITextField(textField: confirmPassword)
        
        func customSetupUITextField(textField: UITextField) {
            textField.clipsToBounds = true
            textField.layer.cornerRadius = textField.frame.size.height / 3
            textField.setLeftPaddingPoints(10)
        }
        
        // Set up tap gesture recognizer for sign-up label
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.signUpLabelTapped(_:)))
        signUpLabel.isUserInteractionEnabled = true
        signUpLabel.addGestureRecognizer(labelTap)
    }
    
    @objc func signUpLabelTapped(_ sender: UITapGestureRecognizer) {
        // Push SignUpViewController onto the navigation stack
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewControllerID") as? SignUpViewController else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - IBActions
    
    @IBAction func forgotPassword(_ sender: Any) {
        // Push ForgotPasswordViewController onto the navigation stack
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "ForgotPasswordViewControllerID") as? ForgotPasswordViewController else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signIn(_ sender: Any) {
        print("SignIn")
        // Push AddTodoViewController onto the navigation stack
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "AddTodoViewControllerID") as? AddTodoViewController else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Dismiss Keyboard
    
    private func dismissKeyboardTapGesture() {
        // Set up tap gesture recognizer to dismiss the keyboard
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
