//
//  LancamentosTableViewModel.swift
//  MovieRoll
//
//  Created by Raul Felippe on 04/06/22.
//

import Foundation

protocol LancamentosViewModelDelegate {
    func reloadTableView()
}

class LancamentosViewModel {
    //MARK: - Variáveis
    let service: Service = .init()

    var delegate: LancamentosViewModelDelegate?
    //MARK: - Variáveis Computadas
    var numberOfRows: Int {
        if service.filmesLancamentos.count > 0 {
            return 1
        }
        return 0
    }
    
    var numberOfSection: Int {
        return service.filmesLancamentos.count
    }
    
    var getFilmesLancamentos: [[Movie]] {
        return service.filmesLancamentos
    }
    //MARK: - Funções Públicas
    func numberOfItems(section: Int) -> Int {
        return service.filmesLancamentos[section].count
    }
    
    func retornaTitulo(section: Int) -> String {
        return service.generos[section]
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
    
    func carregarFilmes() {
        service.filmesLancamentos = []
        for genero in service.generosId {
            service.fetchDiscoverLancamentos(genre: genero) { filmes in
                self.service.filmesLancamentos.append(filmes)
                DispatchQueue.main.async {
                    self.delegate?.reloadTableView()
                }
            }
        }
    }
    
    func getImage(movie: Movie) -> Data {
        let url = "https://image.tmdb.org/t/p/w500\(movie.posterPath)"
        
        guard let urlImage =  URL(string: url) else { return Data() }
        
        guard let imageData = try? Data(contentsOf: urlImage) else { return Data() }
        
        return imageData
    }
}
