//
//  MeusDadosViewModel.swift
//  MovieRoll
//
//  Created by Renato Yoshinari on 06/06/22.
//

import Foundation

class MeusDadosViewModel {
    //MARK: - Variaveis
    private var user: User
    
    init(user: User) {
        self.user = user
    }
    //MARK: - Variaveis Computadas
    var getUserName: String {
        return user.name
    }
    
    var getUserImage: String {
        return user.image
    }
    //MARK: - Funções Públicas
    func setUserName(nome: String?) {
        guard let nome = nome else { return }
        user.name = nome
    }
    
    func setUserImage(image: String) {
        user.image = image
    }
}
