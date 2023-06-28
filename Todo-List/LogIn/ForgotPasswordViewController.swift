//
//  ForgotPasswordViewController.swift
//  Todo-List
//
//  Created by Aren Musayelyan on 28.06.23.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    
    // MARK: - UI Components
    
    @IBOutlet weak var email: UITextField!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customSetupUITextField()
        dismissKeyboardTapGesture()
    }
    
    // MARK: - IBActions
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func resetPassword(_ sender: Any) {
        print("Reset Password")
    }
    
    @IBAction func backToSignIn(_ sender: Any) {
        // Push SignInViewController onto the navigation stack
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignInViewControllerID") as? SignInViewController else { return }
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
    
    // MARK: - UI Setup
    
    private func customSetupUITextField() {
        email.layer.cornerRadius = email.frame.size.height / 3
        email.setLeftPaddingPoints(10)
    }
}
