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
    func secureSenhaTextField()
    func notSecureSenhaTextField()
}

class MeusDadosViewModel {
    
    //MARK: - Public Properties
    
    var delegate: MeusDadosViewModelDelegate?
    
    var getUserName: String {
        return ServiceAuth.userPerfil.name
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
    
    func botaoSalvarAction(email: String?, password: String?) {
        guard let email = email else { return }
        guard let password = password else { return }
        
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
            }
            
          
        
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
