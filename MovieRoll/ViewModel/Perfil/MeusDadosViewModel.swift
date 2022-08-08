//
//  MeusDadosViewModel.swift
//  MovieRoll
//
//  Created by Renato Yoshinari on 06/06/22.
//

import Foundation
import FirebaseAuth

protocol MeusDadosViewModelDelegate {
    func dismissModal()
    func alertaErroAutenticacao(message: String)
    func secureSenhaTextField()
    func notSecureSenhaTextField()
}

class MeusDadosViewModel {
    
    //MARK: - Public Properties
    
    let serviceAuth: ServiceAuth = .init()
    var delegate: MeusDadosViewModelDelegate?
    
    var getUserName: String {
        return ServiceAuth.userProfile.name
    }
    
    var getUserEmail: String {
        return ServiceAuth.userProfile.email
    }
    
    var getUserImage: Data {
        return ServiceAuth.userProfile.image
    }
    
    //MARK: - Public Methods
    
    func setUserName(nome: String?) {
        guard let nome = nome else { return }
        ServiceAuth.userProfile.name = nome
    }
    
    func setUserImage(image: Data) {
        ServiceAuth.userProfile.image = image
    }
    
    func botaoSalvarAction(nome: String?, email: String?, password: String?) {
        guard let nome = nome else { return }
        guard let email = email else { return }
        guard let password = password else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            let error = error as? NSError
            
            if error?.code == 17034 {
                self.delegate?.alertaErroAutenticacao(message: "Entre com um e-mail e tente novamente.")
                return
            }
            
            if error?.code == 17007 {
                self.delegate?.alertaErroAutenticacao(message: "E-mail já cadastrado, tente novamente.")
                return
            }
            
            if error?.code == 17026 {
                self.delegate?.alertaErroAutenticacao(message: "Senha precisa conter pelo menos 6 caracteres, tente novamente.")
                return
            }
            
            if error?.code == 17008 {
                self.delegate?.alertaErroAutenticacao(message: "E-mail não está no formato correto, tente novamente.")
                return
            }
            self.alterarUserName(nome: nome)
            
            Auth.auth().currentUser?.sendEmailVerification { error in

            }
        }
    }
    
    private func alterarUserName(nome: String) {
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = nome
        changeRequest?.commitChanges { _ in
            self.serviceAuth.userInfo()
            self.delegate?.dismissModal()
        }
    }
    
    func eyeButtonPressed(visivel: Bool) {
        if visivel {
            delegate?.notSecureSenhaTextField()
        } else {
            delegate?.secureSenhaTextField()
        }
    }
}
