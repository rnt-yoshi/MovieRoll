//
//  CellTableViewModel.swift
//  MovieRoll
//
//  Created by Renato Yoshinari on 03/06/22.
//

import Foundation

class UserPerfilTableViewCellViewModel {
    private let user: User
    
    init(user: User) {
        self.user = user
    }
    
    var getName: String {
        return user.name
    }
    
    var getImage: String {
        return user.image
    }
}
