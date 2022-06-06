//
//  MeusDadosViewController.swift
//  MovieRoll
//
//  Created by Renato Yoshinari on 04/06/22.
//

import UIKit

class MeusDadosViewController: UIViewController {

    @IBOutlet weak var meusDadosImage: UIImageView!
    @IBOutlet weak var meusDadosNomeTextField: UITextField!
    @IBOutlet weak var meusDadosEmailTextField: UITextField!
    
    var viewModel: MeusDadosViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configuraTela()
    }
    
    func configuraTela() {
        guard let viewModel = viewModel else { return }
        meusDadosImage.image = UIImage(named: viewModel.getUserImage)
        meusDadosImage.layer.cornerRadius = 80
    }
    
    @IBAction func alterarFotoButtonAction(_ sender: Any) {
    }
    
    
    
    @IBAction func salvarButtonAction(_ sender: Any) {
        viewModel?.setUserName(nome: meusDadosNomeTextField.text)
        navigationController?.popViewController(animated: true)
    }
    
}
