//
//  Filme.swift
//  MovieRoll
//
//  Created by Raul Felippe on 04/06/22.
//

import Foundation

class Filme {
    let image: String
    let nome: String
    let ano: Int
    let genero: String
    let nota: Int
    let sinopse: String
    
    init(image: String, nome: String, ano: Int, genero: String, nota: Int, sinopse: String) {
        self.image = image
        self.nome = nome
        self.ano = ano
        self.genero = genero
        self.nota = nota
        self.sinopse = sinopse
    }
}
