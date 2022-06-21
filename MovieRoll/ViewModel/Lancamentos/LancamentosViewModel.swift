//
//  LancamentosTableViewModel.swift
//  MovieRoll
//
//  Created by Raul Felippe on 04/06/22.
//

import Foundation

protocol LancamentosViewModelDelegate {
    func didSelectItem (movie: Movie)
    func reloadTableView()
    func stopLoading()
}

class LancamentosViewModel {
    //MARK: - Variáveis
    let service: Service = .init()

    var delegate: LancamentosViewModelDelegate?
    //MARK: - Variáveis Computadas
    var numberOfRows: Int {
            return 1
    }
    
    var numberOfSection: Int {
        if service.filmesLancamentos[0].count > 0 {
            return service.filmesLancamentos.count
        }
        return 0
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
    
    func setProvidersMovies(row: Int, section: Int) {
        let filme = service.filmesLancamentos[section][row]
        service.fetchProvidersBy(id: filme.id) { providers in
            DispatchQueue.main.async {
                filme.providersId = providers
                self.delegate?.didSelectItem(movie: filme)
            }
        }
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
        for genero in service.generosId {
            service.fetchDiscoverLancamentos(genre: genero) { filmes in
                DispatchQueue.main.async {
                    switch genero {
                    case "28":
                        self.service.filmesLancamentos[0] = filmes
                    case  "878":
                        self.service.filmesLancamentos[1] = filmes
                    case  "53":
                        self.service.filmesLancamentos[2] = filmes
                    case  "27":
                        self.service.filmesLancamentos[3] = filmes
                    case  "12":
                        self.service.filmesLancamentos[4] = filmes
                    case   "18":
                        self.service.filmesLancamentos[5] = filmes
                    case   "10751":
                        self.service.filmesLancamentos[6] = filmes
                    case    "10749":
                        self.service.filmesLancamentos[7] = filmes
                    case   "35":
                        self.service.filmesLancamentos[8] = filmes
                        self.delegate?.reloadTableView()
                        self.delegate?.stopLoading()
                    default:
                        break
                    }
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
