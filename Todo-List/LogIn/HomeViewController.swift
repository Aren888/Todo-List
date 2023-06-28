//
//  HomeViewController.swift
//  Todo-List
//
//  Created by Aren Musayelyan on 27.06.23.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction func getStarted(_ sender: Any) {
        // Instantiate the "Main" storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // Create an instance of SignUpViewController from the storyboard
        if let signUpViewController = storyboard.instantiateViewController(withIdentifier: "SignUpViewControllerID") as? SignUpViewController {
            // Push the SignUpViewController onto the navigation stack
            navigationController?.pushViewController(signUpViewController, animated: true)
        }
    }
}
