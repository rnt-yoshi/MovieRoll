//
//  OptionsPerfilTableViewCellViewModel.swift
//  MovieRoll
//
//  Created by Renato Yoshinari on 03/06/22.
//

import Foundation

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
    
    var getImage: String {
        return option.imagem
    }
}
