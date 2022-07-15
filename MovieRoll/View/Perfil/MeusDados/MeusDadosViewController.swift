//
//  MeusDadosViewController.swift
//  MovieRoll
//
//  Created by Renato Yoshinari on 04/06/22.
//

import UIKit
import FirebaseAuth

class MeusDadosViewController: UIViewController {

    //MARK: - Componentes
    
    lazy var meusDadosImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 64
        image.backgroundColor = UIColor(named: "darkGrayMovieRoll")
        return image
    }()
        
    lazy var alterarFotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Alterar Foto", for: .normal)
        button.addTarget(self, action: #selector(alterarFotoButtonAction), for: .touchUpInside)
        return button
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nome"
        label.textColor = .white
       return label
    }()
    
    lazy var meusDadosNomeTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(
            string: "Digite seu nome",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        textField.backgroundColor = UIColor(named: "darkGrayMovieRoll")
        textField.borderStyle = .roundedRect
        textField.font = UIFont(name: "AmsiPro-Regular", size: 17)
        return textField
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "E-mail"
        label.textColor = .white
       return label
    }()
    
    lazy var meusDadosEmailTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .emailAddress
        textField.attributedPlaceholder = NSAttributedString(
            string: "Digite seu e-mail",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        textField.backgroundColor = UIColor(named: "darkGrayMovieRoll")
        textField.borderStyle = .roundedRect
        textField.font = UIFont(name: "AmsiPro-Regular", size: 17)
        return textField
    }()
    
    lazy var senhaLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Senha"
        label.textColor = .white
       return label
    }()
    
    lazy var meusDadosSenhaTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(
            string: "Digite sua senha",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        textField.backgroundColor = UIColor(named: "darkGrayMovieRoll")
        textField.borderStyle = .roundedRect
        textField.font = UIFont(name: "AmsiPro-Regular", size: 17)
        return textField
    }()
    
    lazy var salvarButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Salvar", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "AmsiPro-Bold", size: 17)
        button.backgroundColor = UIColor(named: "orangeMovieRoll")
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(salvarButtonAction), for: .touchUpInside)
        return button
    }()
    
    
    //MARK: - Public Properties
    
    var viewModel: MeusDadosViewModel?

    //MARK: - Public Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(meusDadosImage)
        view.addSubview(alterarFotoButton)
        view.addSubview(nameLabel)
        view.addSubview(meusDadosNomeTextField)
        view.addSubview(emailLabel)
        view.addSubview(meusDadosEmailTextField)
        view.addSubview(senhaLabel)
        view.addSubview(meusDadosSenhaTextField)
        view.addSubview(salvarButton)
        setupConstraints()
        
        configuraTela()
    }
    
    //MARK: - Private Methods
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            meusDadosImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            meusDadosImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            meusDadosImage.heightAnchor.constraint(equalToConstant: 128),
            meusDadosImage.widthAnchor.constraint(equalToConstant: 128),

            alterarFotoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            alterarFotoButton.topAnchor.constraint(equalTo: meusDadosImage.bottomAnchor, constant: 16),
            
            nameLabel.topAnchor.constraint(equalTo: alterarFotoButton.bottomAnchor, constant: 24),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            meusDadosNomeTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            meusDadosNomeTextField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            meusDadosNomeTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            emailLabel.topAnchor.constraint(equalTo: meusDadosNomeTextField.bottomAnchor, constant: 24),
            emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            meusDadosEmailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 4),
            meusDadosEmailTextField.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            meusDadosEmailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            senhaLabel.topAnchor.constraint(equalTo: meusDadosEmailTextField.bottomAnchor, constant: 24),
            senhaLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            meusDadosSenhaTextField.topAnchor.constraint(equalTo: senhaLabel.bottomAnchor, constant: 4),
            meusDadosSenhaTextField.leadingAnchor.constraint(equalTo: senhaLabel.leadingAnchor),
            meusDadosSenhaTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            salvarButton.topAnchor.constraint(equalTo: meusDadosSenhaTextField.bottomAnchor, constant: 45),
            salvarButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            salvarButton.widthAnchor.constraint(equalToConstant: 170)
        ])
    }
    
    private func configuraTela() {
        guard let viewModel = viewModel else { return }
        meusDadosNomeTextField.text = viewModel.getUserName
        
        meusDadosImage.image = UIImage(named: viewModel.getUserImage)
    }
    
    //MARK: - Actions
        
    @objc func alterarFotoButtonAction() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
        present(imagePicker, animated: true)
    }
    
    @objc func salvarButtonAction() {
//        viewModel?.setUserName(nome: meusDadosNomeTextField.text)
//        navigationController?.popViewController(animated: true)
        guard let email = meusDadosEmailTextField.text else { return }
        guard let password = meusDadosSenhaTextField.text else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            self.dismiss(animated: true)
        }
    }
    
}

//MARK: - UIImagePickerController Delegate
    
extension MeusDadosViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as?  UIImage {
            meusDadosImage.image = image
        }
        dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
}
