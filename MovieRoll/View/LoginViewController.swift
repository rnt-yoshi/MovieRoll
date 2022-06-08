//
//  LoginViewController.swift
//  MovieRoll
//
//  Created by Raul Felippe on 08/06/22.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func enterAction(_ sender: Any) {
        if let tabBar = storyboard?.instantiateViewController(withIdentifier: "idTabController") as? TabBarController {
            tabBar.modalPresentationStyle = .fullScreen
            tabBar.modalTransitionStyle = .flipHorizontal
            present(tabBar, animated: true)
        }

    }
    

}
