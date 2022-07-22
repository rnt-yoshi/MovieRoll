//
//  LoginViewController.swift
//  MovieRoll
//
//  Created by Raul Felippe on 08/06/22.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import GoogleSignIn
import FacebookLogin

final class LoginViewController: UIViewController {
    
    //MARK: - Components
    
    lazy var logoImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "logotipo")
        return image
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "E-mail"
        label.textColor = .white
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
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
    
    lazy var senhaTextField: UITextField = {
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
    
    lazy var esqueciMunhaSenhaButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Esqueci minha senha", for: .normal)
        button.setTitleColor(UIColor(named: "blueMovieRoll"), for: .normal)
        button.titleLabel?.font = UIFont(name: "AmsiPro-Regular", size: 14)
        button.addTarget(self, action: #selector(esqueciMunhaSenhaButtonAction), for: .touchUpInside)
        return button
    }()
    
    lazy var entrarButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entrar", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "AmsiPro-Bold", size: 17)
        button.backgroundColor = UIColor(named: "blueMovieRoll")
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(entrarButtonAction), for: .touchUpInside)
        return button
    }()
    
    lazy var googleButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "google"), for: .normal)
        button.imageView?.image = UIImage(named: "google")
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(googleButtonAction), for: .touchUpInside)
        return button
    }()
    
    lazy var facebookButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "facebook"), for: .normal)
        button.imageView?.image = UIImage(named: "facebook")
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(facebookButtonAction), for: .touchUpInside)
        return button
    }()
    
    lazy var cadastrarButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar-se", for: .normal)
        button.setTitleColor(UIColor(named: "blueMovieRoll"), for: .normal)
        button.titleLabel?.font = UIFont(name: "AmsiPro-Bold", size: 20)
        button.addTarget(self, action: #selector(cadastrarButtonAction), for: .touchUpInside)
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
    
    //MARK: - Public Methods
    
    let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(logoImage)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(senhaLabel)
        view.addSubview(senhaTextField)
        view.addSubview(esqueciMunhaSenhaButton)
        view.addSubview(entrarButton)
        view.addSubview(googleButton)
        view.addSubview(facebookButton)
        view.addSubview(cadastrarButton)
        view.addSubview(eyeButton)
        
        setupConstraints()
        viewModel.delegate = self
    }
    //MARK: - Private Methods
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 64),
            logoImage.heightAnchor.constraint(equalToConstant: 180),
            logoImage.widthAnchor.constraint(equalToConstant: 180),
            
            emailLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 24),
            emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
            emailLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 2),
            emailTextField.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            
            senhaLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            senhaLabel.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            senhaLabel.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            
            senhaTextField.topAnchor.constraint(equalTo: senhaLabel.bottomAnchor, constant: 2),
            senhaTextField.leadingAnchor.constraint(equalTo: senhaLabel.leadingAnchor),
            senhaTextField.trailingAnchor.constraint(equalTo: senhaLabel.trailingAnchor),
            
            esqueciMunhaSenhaButton.topAnchor.constraint(equalTo: senhaTextField.bottomAnchor, constant: 2),
            esqueciMunhaSenhaButton.trailingAnchor.constraint(equalTo: senhaTextField.trailingAnchor),
            
            entrarButton.topAnchor.constraint(equalTo: esqueciMunhaSenhaButton.bottomAnchor, constant: 24),
            entrarButton.leadingAnchor.constraint(equalTo: senhaTextField.leadingAnchor),
            entrarButton.trailingAnchor.constraint(equalTo: senhaTextField.trailingAnchor),
            
            
            googleButton.topAnchor.constraint(equalTo: entrarButton.bottomAnchor, constant: 22),
            googleButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            googleButton.heightAnchor.constraint(equalToConstant: 60),
            googleButton.widthAnchor.constraint(equalToConstant: 60),
            
            facebookButton.topAnchor.constraint(equalTo: entrarButton.bottomAnchor, constant: 24),
            facebookButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            facebookButton.heightAnchor.constraint(equalToConstant: 50),
            facebookButton.widthAnchor.constraint(equalToConstant: 50),
            
            
            cadastrarButton.topAnchor.constraint(equalTo: facebookButton.bottomAnchor, constant: 40),
            cadastrarButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            eyeButton.centerYAnchor.constraint(equalTo: senhaTextField.centerYAnchor),
            eyeButton.heightAnchor.constraint(equalToConstant: 20),
            eyeButton.widthAnchor.constraint(equalToConstant: 25),
            eyeButton.trailingAnchor.constraint(equalTo: senhaTextField.trailingAnchor, constant: -6),
        ])
    }
    //MARK: - Actions
    
    @objc private func esqueciMunhaSenhaButtonAction() {
        
        
    }
    
    @objc private func entrarButtonAction() {
        viewModel.efetuarLoginEmailSenha(
            email: emailTextField.text,
            password: senhaTextField.text
        )
    }
    
    @objc private func googleButtonAction() {
        viewModel.efetuarLoginGoogle()
    }
    
    @objc private func facebookButtonAction() {
        viewModel.efetuarLoginFacebook()
    }
    
    @objc private func cadastrarButtonAction() {
        let meusDadosVC = MeusDadosViewController()
        meusDadosVC.viewModel = MeusDadosViewModel()
        present(meusDadosVC, animated: true)
        
    }
    
    @objc private func eyeButtonAction() {
        viewModel.eyeButtonPressed(visivel: senhaTextField.isSecureTextEntry)
    }
}

extension LoginViewController: LoginViewModelDelegate {
    func secureSenhaTextField() {
        eyeButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        senhaTextField.isSecureTextEntry = true
    }
    
    func notSecureSenhaTextField() {
        eyeButton.setImage(UIImage(systemName: "eye"), for: .normal)
        senhaTextField.isSecureTextEntry = false
    }
    
    func alertaErroLogin() {
        let alerta = UIAlertController(title: "Erro ao fazer o login", message: "Tente novamente.", preferredStyle: .alert)

        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alerta.addAction(okAction)
    
        present(alerta, animated: true)
    }
    
    func loginFacebook(loginManager: LoginManager) {
        loginManager.logIn(permissions: ["public_profile", "email"], from: self) { result, error in
    self.viewModel.tratarLoginFacebook(result: result, error: error)
}
    }
    
    func dismissModal() {
        dismiss(animated: true)
    }
    
    func loginGoogle(configuration: GIDConfiguration) {
        GIDSignIn.sharedInstance.signIn(
            with: configuration,
            presenting: self
        ) { [unowned self] user, error in
            self.viewModel.tratarLoginGoogle(
                user: user,
                error: error
            )
        }
    }
}

import SwiftUI

struct LoginViewControllerPreviews: PreviewProvider {
    static var previews: some View {
        ForEach(deviceNames, id: \.self) { deviceName in
            ViewControllerPreview {
                LoginViewController()
            }.previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
