//
//  LancamentosTableViewModel.swift
//  MovieRoll
//
//  Created by Raul Felippe on 04/06/22.
//

import Foundation

protocol LancamentosViewModelDelegate {
    func didSelectItem (movie: Movie)
}

class LancamentosViewModel {
    //MARK: - Variáveis
    let service: Service = .init()
    let coreDataService: CoreDataService = .init()

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
        return coreDataService.pegarListaDeFavoritosNoCoreData().contains { favorito in
            movie.title == favorito.title
        }
    }
    
    func verificaAssistido(movie: Movie) -> Bool {
        return coreDataService.pegarListaDeAssistidosNoCoreData().contains { assistido in
            movie.title == assistido.title
        }
    }
    
    
    private func verificaFilmesLancamentos() -> Bool {
        for lancamento in service.filmesLancamentos {
            if lancamento.count == 0 {
                return false
            }
        }
        
        return true
    }
    
    func carregarFilmes(completion: @escaping () -> Void) {
  
        for genero in service.generosId {
            service.fetchDiscoverLancamentos(genre: genero) { filmes in
                switch genero {
                case "28":
                    self.service.filmesLancamentos[0] = filmes
                    if self.verificaFilmesLancamentos() {
                        completion()
                    }
                case  "878":
                    self.service.filmesLancamentos[1] = filmes
                    if self.verificaFilmesLancamentos() {
                        completion()
                    }
                case  "53":
                    self.service.filmesLancamentos[2] = filmes
                    if self.verificaFilmesLancamentos() {
                        completion()
                    }
                case  "27":
                    self.service.filmesLancamentos[3] = filmes
                    if self.verificaFilmesLancamentos() {
                        completion()
                    }
                case  "12":
                    self.service.filmesLancamentos[4] = filmes
                    if self.verificaFilmesLancamentos() {
                        completion()
                    }
                case   "18":
                    self.service.filmesLancamentos[5] = filmes
                    if self.verificaFilmesLancamentos() {
                        completion()
                    }
                case   "10751":
                    self.service.filmesLancamentos[6] = filmes
                    if self.verificaFilmesLancamentos() {
                        completion()
                    }
                case    "10749":
                    self.service.filmesLancamentos[7] = filmes
                    if self.verificaFilmesLancamentos() {
                        completion()
                    }
                case   "35":
                    self.service.filmesLancamentos[8] = filmes
                    if self.verificaFilmesLancamentos() {
                        completion()
                    }
                default:
                    break
                    
                }
            }
        }
        
    }
    
    func getImage(section: Int, row: Int) -> Data {
        let movie = service.filmesLancamentos[section][row]
        if movie.posterImage == Data() {
            service.getImageFromUrl(movie: movie) { image in
                movie.posterImage = image
            }
        }
        return movie.posterImage
    }
}
