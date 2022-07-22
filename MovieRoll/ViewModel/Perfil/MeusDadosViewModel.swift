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
    func alertaErrorEmail()
    func alertaErrorPassword()
    func alertaErroAutenticacao()
    func secureSenhaTextField()
    func notSecureSenhaTextField()
}

class MeusDadosViewModel {
    
    //MARK: - Public Properties
    
    let serviceAuth: ServiceAuth = .init()
    var delegate: MeusDadosViewModelDelegate?
    
    var getUserName: String {
        return ServiceAuth.userPerfil.name
    }
    
    var getUserEmail: String {
        return ServiceAuth.userPerfil.email
    }
    
    var getUserImage: Data {
        return ServiceAuth.userPerfil.image
    }
    
    //MARK: - Public Methods
    
    func setUserName(nome: String?) {
        guard let nome = nome else { return }
        ServiceAuth.userPerfil.name = nome
    }
    
    func setUserImage(image: Data) {
        ServiceAuth.userPerfil.image = image
    }
    
    func botaoSalvarAction(nome: String?, email: String?, password: String?) {
        guard let nome = nome else { return }
        guard let email = email else { return }
        guard let password = password else { return }
        
        if Auth.auth().currentUser == nil {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if error != nil {
                    guard let descricaoError = error?.localizedDescription else { return }
                    if descricaoError.contains("email") {
                        self.delegate?.alertaErrorEmail()
                        return
                    }
                    if descricaoError.contains("password") {
                        self.delegate?.alertaErrorPassword()
                        return
                    }
                    self.delegate?.alertaErroAutenticacao()
                    return
                }
                self.alterarUserName(nome: nome)
            }
        } else {
            alterarUserName(nome: nome)
        }
    }
    
    private func alterarUserName(nome: String) {
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = nome
        changeRequest?.commitChanges { error in
            if error != nil {
                guard let descriptionError = error?.localizedDescription else { return }
                print(descriptionError)
            }
            self.serviceAuth.informacoesDoUsuario()
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
