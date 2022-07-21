//
//  MeusDadosViewModel.swift
//  MovieRoll
//
//  Created by Renato Yoshinari on 06/06/22.
//

import Foundation

class MeusDadosViewModel {
    
    //MARK: - Public Properties
    
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
}
