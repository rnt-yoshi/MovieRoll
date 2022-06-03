//
//  CellTableViewModel.swift
//  MovieRoll
//
//  Created by Renato Yoshinari on 03/06/22.
//

import UIKit

class UserPerfilTableViewCellViewModel {
    private let user: User
    
    init(user: User) {
        self.user = user
    }
    
    var getName: String {
        return user.name
    }
    
    var getImage: UIImage {
        return UIImage(named: user.image) ?? UIImage()
    }
}
