//
//  MeusDadosViewModel.swift
//  MovieRoll
//
//  Created by Renato Yoshinari on 06/06/22.
//

import Foundation

class MeusDadosViewModel {
    //MARK: - Private Properties
    
    private var user: User
    
    init(user: User) {
        self.user = user
    }
    
    //MARK: - Public Properties
    
    var getUserName: String {
        return user.name
    }
    
    var getUserImage: Data {
        return user.image
    }
    
    //MARK: - Public Methods
    
    func setUserName(nome: String?) {
        guard let nome = nome else { return }
        user.name = nome
    }
    
    func setUserImage(image: Data) {
        user.image = image
    }
}
