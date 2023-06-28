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
    
    // MARK: - @IBAction
    @IBAction func getStarted(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewControllerID") as? SignUpViewController else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
