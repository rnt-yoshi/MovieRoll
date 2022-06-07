//
//  MeusDadosViewModel.swift
//  MovieRoll
//
//  Created by Renato Yoshinari on 06/06/22.
//

import Foundation

class MeusDadosViewModel {
    
    private var user: User
    
    init(user: User) {
        self.user = user
    }
    
    var getUserName: String {
        return user.name
    }
    
    var getUserImage: String {
        return user.image
    }
    
    func setUserName(nome: String?) {
        guard let nome = nome else { return }
        user.name = nome
    }
    
    func setUserImage(image: String?) {
        guard let image = image else { return }
        user.image = image
    }
}
