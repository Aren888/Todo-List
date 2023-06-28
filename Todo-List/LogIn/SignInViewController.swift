//
//  SignInViewController.swift
//  Todo-List
//
//  Created by Aren Musayelyan on 27.06.23.
//

import UIKit

class SignInViewController: UIViewController {
    
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var signUpLabel: UILabel!
    
    @IBOutlet weak var labelConstraints: NSLayoutConstraint!
    @IBOutlet weak var imageConstraintsHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signInLabelTapped()
        dismissKeyboardTapGesture()
        keyboardNotificationSetUp()
    }
    
    private func keyboardNotificationSetUp() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
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
    
    private func signInLabelTapped() {
        customSetupUITextField(textField: email)
        customSetupUITextField(textField: confirmPassword)
        
        func customSetupUITextField(textField: UITextField) {
            textField.clipsToBounds = true
            textField.layer.cornerRadius = textField.frame.size.height / 3
            textField.setLeftPaddingPoints(10)
        }
        
        // TODO: - Setup Label Tap
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.signUpLabelTapped(_:)))
        signUpLabel.isUserInteractionEnabled = true
        signUpLabel.addGestureRecognizer(labelTap)
    }
    
    @objc func signUpLabelTapped(_ sender: UITapGestureRecognizer) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewControllerID") as? SignUpViewController else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func forgotPassword(_ sender: Any) {
        
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "ForgotPasswordViewControllerID") as? ForgotPasswordViewController else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signIn(_ sender: Any) {
        print("SignIn")
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "AddTodoViewControllerID") as? AddTodoViewController else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // TODO: - Dismiss Keyboard
    private func dismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
