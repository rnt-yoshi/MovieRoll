//
//  LancamentosTableViewModel.swift
//  MovieRoll
//
//  Created by Raul Felippe on 04/06/22.
//

import Foundation

class LancamentosViewModel {
    
    let service: Service
    var filmes: [Filme] = []
    var generos: [String] = []
    
    init(service: Service = Service() ){
        self.service = service
    }
    
    var numberOfSection: Int {
        return generos.count
    }
    
    func pegarFilmesEGeneros() {
        filmes = service.filmes
        generos = service.generos
    }
    
    func numberOfItems(section: Int) -> Int {
        let filmesFiltrado = filmes
        return filmesFiltrado.count
    }
    
    func retornaTitulo(section: Int) -> String {
        return generos[section]
    }
    
    func retornaFilmes(row: Int, section: Int) -> Filme {
        return Service.shared.filmesLancamentos[section][row]
    }
    
    var getFilmesLancamentos: [[Filme]] {
        return Service.shared.filmesLancamentos
    }
    
    func verificaFavorito(filme: Filme) -> Bool {
        return Service.shared.filmesFavoritos.contains { filmeFavorito in
            filme.nome == filmeFavorito.nome
        }
    }
    
    func verificaAssistido(filme: Filme) -> Bool {
        return Service.shared.filmesAssistidos.contains { filmeFavorito in
            filme.nome == filmeFavorito.nome
        }
    }
}
