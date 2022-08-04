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
        textField.autocapitalizationType = UITextAutocapitalizationType.none
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
        textField.isSecureTextEntry = true
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
    
    lazy var eyeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        button.tintColor = UIColor.gray
        button.addTarget(self, action: #selector(eyeButtonAction), for: .touchUpInside)
        return button
    }()
    
    lazy var closeButton: UIButton = {
        let button = UIButton(type: .close)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = UIColor(named: "darkGrayMovieRoll")
        button.addTarget(self, action: #selector(closeButtonAction), for: .touchUpInside)
        return button
    }()
    
    
    
    //MARK: - Public Properties
    
    var viewModel: MeusDadosViewModel?

    //MARK: - Public Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        title = "Meus Dados"
        view.addSubview(meusDadosImage)
        view.addSubview(nameLabel)
        view.addSubview(meusDadosNomeTextField)
        view.addSubview(emailLabel)
        view.addSubview(meusDadosEmailTextField)
        view.addSubview(senhaLabel)
        view.addSubview(meusDadosSenhaTextField)
        view.addSubview(salvarButton)
        view.addSubview(eyeButton)
        view.addSubview(closeButton)
        setupConstraints()
        
        configuraTela()
        
        viewModel?.delegate = self
    }
    
    //MARK: - Private Methods
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            meusDadosImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            meusDadosImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            meusDadosImage.heightAnchor.constraint(equalToConstant: 128),
            meusDadosImage.widthAnchor.constraint(equalToConstant: 128),

            nameLabel.topAnchor.constraint(equalTo: meusDadosImage.bottomAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64),
            
            meusDadosNomeTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            meusDadosNomeTextField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            meusDadosNomeTextField.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            
            emailLabel.topAnchor.constraint(equalTo: meusDadosNomeTextField.bottomAnchor, constant: 16),
            emailLabel.leadingAnchor.constraint(equalTo: meusDadosNomeTextField.leadingAnchor),
            emailLabel.trailingAnchor.constraint(equalTo: meusDadosNomeTextField.trailingAnchor),
            
            meusDadosEmailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 4),
            meusDadosEmailTextField.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            meusDadosEmailTextField.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            
            senhaLabel.topAnchor.constraint(equalTo: meusDadosEmailTextField.bottomAnchor, constant: 16),
            senhaLabel.leadingAnchor.constraint(equalTo: meusDadosEmailTextField.leadingAnchor),
            senhaLabel.trailingAnchor.constraint(equalTo: meusDadosEmailTextField.trailingAnchor),
            
            meusDadosSenhaTextField.topAnchor.constraint(equalTo: senhaLabel.bottomAnchor, constant: 4),
            meusDadosSenhaTextField.leadingAnchor.constraint(equalTo: senhaLabel.leadingAnchor),
            meusDadosSenhaTextField.trailingAnchor.constraint(equalTo: senhaLabel.trailingAnchor),
            
            salvarButton.topAnchor.constraint(equalTo: meusDadosSenhaTextField.bottomAnchor, constant: 45),
            salvarButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            salvarButton.widthAnchor.constraint(equalToConstant: 170),
            
            eyeButton.centerYAnchor.constraint(equalTo: meusDadosSenhaTextField.centerYAnchor),
            eyeButton.heightAnchor.constraint(equalToConstant: 20),
            eyeButton.widthAnchor.constraint(equalToConstant: 25),
            eyeButton.trailingAnchor.constraint(equalTo: meusDadosSenhaTextField.trailingAnchor, constant: -6),
            
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -4),
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 4),
        ])
    }
    
    private func configuraTela() {
        guard let viewModel = viewModel else { return }
        meusDadosNomeTextField.text = viewModel.getUserName
        meusDadosEmailTextField.text = viewModel.getUserEmail
        meusDadosImage.image = UIImage(data: viewModel.getUserImage) ?? UIImage(named: "perfil")
    }
    
    //MARK: - Actions
    
    @objc func salvarButtonAction() {
        viewModel?.botaoSalvarAction(
            nome: meusDadosNomeTextField.text,
            email: meusDadosEmailTextField.text,
            password: meusDadosSenhaTextField.text
        )
    }
    
    @objc func eyeButtonAction() {
        viewModel?.eyeButtonPressed(visivel: meusDadosSenhaTextField.isSecureTextEntry)
    }
    
    @objc func closeButtonAction() {
        dismiss(animated: true)
    }
}

extension MeusDadosViewController: MeusDadosViewModelDelegate {
    func alertaErroAutenticacao(message: String) {
        let alerta = UIAlertController(title: "Atenção", message: message, preferredStyle: .alert)

        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alerta.addAction(okAction)
    
        present(alerta, animated: true)
    }
    
    func secureSenhaTextField() {
        eyeButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        meusDadosSenhaTextField.isSecureTextEntry = true
    }
    
    func notSecureSenhaTextField() {
        eyeButton.setImage(UIImage(systemName: "eye"), for: .normal)
        meusDadosSenhaTextField.isSecureTextEntry = false
    }
    
    func dismissModal() {
        presentingViewController?.presentingViewController?.childViewControllerForPointerLock?.children.last?.viewWillAppear(true)
        self.view.window!.rootViewController?.dismiss(animated: true)
        self.navigationController?.popViewController(animated: true)
    }
    
    func alertaErrorPassword() {
        let alerta = UIAlertController(title: "Atenção", message: "Senha precisa ter 6 caracteres", preferredStyle: .alert)

        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alerta.addAction(okAction)
    
        present(alerta, animated: true)
    }
 
    func alertaErrorEmail() {
        let alerta = UIAlertController(title: "Atenção", message: "E-mail no formato inválido", preferredStyle: .alert)

        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alerta.addAction(okAction)
    
        present(alerta, animated: true)
    }
}
