//
//  OptionsPerfilTableViewCellViewModel.swift
//  MovieRoll
//
//  Created by Renato Yoshinari on 03/06/22.
//

import UIKit

class OptionsPerfilTableViewCellViewModel {
    private let option: OptionsPerfil
    
    init(option: OptionsPerfil) {
        self.option = option
    }
    
    var getTitulo: String {
        return option.titulo
    }
    
    var getSubtitulo: String {
        return option.subtitulo
    }
    
    var getImage: UIImage {
        return UIImage(systemName: option.imagem) ?? UIImage()
    }
}
