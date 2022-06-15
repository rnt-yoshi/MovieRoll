//
//  LancamentosTableViewModel.swift
//  MovieRoll
//
//  Created by Raul Felippe on 04/06/22.
//

import Foundation

class LancamentosViewModel {
    //MARK: - Variáveis
    let service: Service
    var filmes: [Filme] = []
    var generos: [String] = []
    
    init(service: Service = Service() ){
        self.service = service
    }
    //MARK: - Variáveis Computadas
    var numberOfSection: Int {
        return generos.count
    }
    
    var getFilmesLancamentos: [[Filme]] {
        return service.filmesLancamentos
    }
    //MARK: - Funções Públicas
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
        return service.filmesLancamentos[section][row]
    }
    
    func verificaFavorito(filme: Filme) -> Bool {
        return service.filmesFavoritos.contains { filmeFavorito in
            filme.nome == filmeFavorito.nome
        }
    }
    
    func verificaAssistido(filme: Filme) -> Bool {
        return service.filmesAssistidos.contains { filmeFavorito in
            filme.nome == filmeFavorito.nome
        }
    }
}
