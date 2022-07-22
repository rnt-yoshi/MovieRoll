//
//  LoginViewModel.swift
//  MovieRoll
//
//  Created by Renato Yoshinari on 18/07/22.
//

import Foundation
import FirebaseAuth
import GoogleSignIn
import FacebookLogin

protocol LoginViewModelDelegate {
    func loginGoogle(configuration: GIDConfiguration)
    func dismissModal()
    func loginFacebook(loginManager: LoginManager)
    func alertaErroLogin()
    func secureSenhaTextField()
    func notSecureSenhaTextField()
}

class LoginViewModel{
    let serviceAuth: ServiceAuth = .init()
    var delegate: LoginViewModelDelegate?
    
    func efetuarLoginEmailSenha(email: String?, password: String?) {
        guard let email = email else { return }
        guard let password = password else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let self = self else { return }
            if error != nil {
                self.delegate?.alertaErroLogin()
                return
            }
            self.delegate?.dismissModal()
        }
    }
    
    func efetuarLoginGoogle() {
        guard let configuration = serviceAuth.pegarConfiguracaoGoogle() else { return }
        
        delegate?.loginGoogle(configuration: configuration)
    }
    
    func tratarLoginGoogle(user: GIDGoogleUser?, error: Error?) {
        // tratativa de erro
        if let error = error {
            print(error)
            return
        }
        
        // login do google deu certo
        salvarDadosNoFirebase(user: user) { _ in
            self.delegate?.dismissModal()
        }
        
        
    }
    
    func efetuarLoginFacebook() {
        
        let loginManager = LoginManager()
        
        delegate?.loginFacebook(loginManager: loginManager)
    }
    
    func tratarLoginFacebook(result:LoginManagerLoginResult?, error: Error?) {
        serviceAuth.tratarResultadoLoginFacebook(result: result, error: error) { _ in
            self.delegate?.dismissModal()
        }
        
    }
    
    private func salvarDadosNoFirebase(user: GIDGoogleUser?, completion: @escaping (Bool) -> Void) {
        guard let credencial = serviceAuth.pegarCredencialGoogle(de: user) else { return }

        serviceAuth.salvarNoFirebase(com: credencial, completion: completion)
    }
    
    func eyeButtonPressed(visivel: Bool) {
        if visivel {
            delegate?.notSecureSenhaTextField()
        } else {
            delegate?.secureSenhaTextField()
        }
    }
}
