//
//  LoginViewController.swift
//  MovieRoll
//
//  Created by Raul Felippe on 08/06/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - Private Properties
    
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var senhaTextField: UITextField!
   
    //MARK: - Public Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextField()
    }
    //MARK: - Private Methods
    
    private func configureTextField() {
        emailTextField.attributedPlaceholder = NSAttributedString(string:"Entre com seu e-mail", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
       
        senhaTextField.attributedPlaceholder = NSAttributedString(string:"Senha", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    }
    
    @IBAction private func enterAction(_ sender: Any) {
        if let tabBar = storyboard?.instantiateViewController(withIdentifier: "idTabController") as? TabBarController {
            tabBar.modalPresentationStyle = .fullScreen
            tabBar.modalTransitionStyle = .flipHorizontal
            present(tabBar, animated: true)
        }
    }
}
