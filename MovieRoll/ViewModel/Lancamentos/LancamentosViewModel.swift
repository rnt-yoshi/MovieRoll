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
    var movies: [Movie] = []
    var generos: [String] = []
    
    init(service: Service = Service() ){
        self.service = service
    }
    //MARK: - Variáveis Computadas
    var numberOfSection: Int {
        return generos.count
    }
    
    var getFilmesLancamentos: [[Movie]] {
        return service.filmesLancamentos
    }
    //MARK: - Funções Públicas
    func pegarFilmesEGeneros() {
        movies = service.movies
        generos = service.generos
    }
    
    func numberOfItems(section: Int) -> Int {
        let filmesFiltrado = movies
        return filmesFiltrado.count
    }
    
    func retornaTitulo(section: Int) -> String {
        return generos[section]
    }
    
    func retornaFilmes(row: Int, section: Int) -> Movie {
        return service.filmesLancamentos[section][row]
    }
    
    func verificaFavorito(movie: Movie) -> Bool {
        return service.filmesFavoritos.contains { filmeFavorito in
            movie.title == filmeFavorito.title
        }
    }
    
    func verificaAssistido(movie: Movie) -> Bool {
        return service.filmesAssistidos.contains { filmeFavorito in
            movie.title == filmeFavorito.title
        }
    }
}
