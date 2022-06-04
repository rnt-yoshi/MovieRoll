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
    
    func getImage(indexPath: IndexPath) -> String {
        if indexPath.section == 0 {
            return userPerfil.image
        } else {
            return optionsPerfil[indexPath.row].imagem
        }
    }
    
    func getMaximumSize(indexPath: IndexPath) -> Int {
        if indexPath.section == 0 {
            return 64
        } else {
            return 32
        }
    }
    
    func getCornerRadius(indexPath: IndexPath) -> Int{
        if indexPath.section == 0 {
            return 32
        } else {
            return 5
        }
    }
    
    func getText(indexPath: IndexPath) -> String {
        if indexPath.section == 0 {
            return userPerfil.name
        } else {
            return optionsPerfil[indexPath.row].titulo
        }
    }
    
    func getSecondaryText(indexPath: IndexPath) -> String? {
        if indexPath.section == 0 {
            return nil
        } else {
            return optionsPerfil[indexPath.row].subtitulo
        }
    }
}
