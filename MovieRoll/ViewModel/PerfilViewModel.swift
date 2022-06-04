//
//  PerfilViewModel.swift
//  MovieRoll
//
//  Created by Renato Yoshinari on 03/06/22.
//

import Foundation
import UIKit

class PerfilViewModel {
    
    var numberOfSection: Int {
        return 2
    }
    
    func numberOfRows(section: Int) -> Int {
        if section == 0 {
            return 1
        }
        if section == 1 {
            return optionsPerfil.count
        }
        return 0
    }
}
