//
//  PerfilData.swift
//  MovieRoll
//
//  Created by Renato Yoshinari on 03/06/22.
//

import Foundation


class OptionsPerfil {
    var titulo: String
    var subtitulo: String
    var imagem: String
    
    init(titulo: String, subtitulo: String, imagem: String) {
        self.titulo = titulo
        self.subtitulo = subtitulo
        self.imagem = imagem
    }
}

var userPerfil = OptionsPerfil(
    titulo: "Renato",
    subtitulo: "",
    imagem: "Renato"
)

var optionsPerfil = [
    OptionsPerfil(
        titulo: "Meus Dados",
        subtitulo: "Meus dados pessoais.",
        imagem: "doc.text"
    ),
    OptionsPerfil(
        titulo: "Histórico",
        subtitulo: "Histórico da Roleta, favoritos e assistidos.",
        imagem: "clock.arrow.circlepath"
    ),
    OptionsPerfil(
        titulo: "Configurações",
        subtitulo: "Configurações do app.",
        imagem: "gear"
    ),
    OptionsPerfil(
        titulo: "Ajuda",
        subtitulo: "Ajuda do app.",
        imagem: "questionmark.circle"
    )
]
