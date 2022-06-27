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
        if service.filmesLancamentos["28"]?.count ?? 0 > 0 {
            return service.filmesLancamentos.count
        }
        return 0
    }
    
    //MARK: - Funções Públicas
    func numberOfItems(section: Int) -> Int {
        return Array(service.filmesLancamentos.values)[section].count

    }
    
    func retornaTitulo(section: Int) -> String {
        let chave = Array(service.filmesLancamentos.keys)[section]
        return service.generos[chave] ?? ""
    }
    
    func retornaFilmes(row: Int, section: Int) -> Movie {
    
        return Array(service.filmesLancamentos.values)[section][row]
    }
    
    func setProvidersMovies(row: Int, section: Int) {
        let filme = Array(service.filmesLancamentos.values)[section][row]
        service.fetchProvidersBy(id: filme.id) { providers in
            DispatchQueue.main.async {
                filme.providersId = providers
                self.delegate?.didSelectItem(movie: filme)
            }
        }
    }

    func verificaFavorito(movie: Movie) -> Bool {
        return coreDataService.pegarListaDeFavoritosNoCoreData().contains { favorito in
            movie.id == favorito.id
        }
    }
    
    func verificaAssistido(movie: Movie) -> Bool {
        return coreDataService.pegarListaDeAssistidosNoCoreData().contains { assistido in
            movie.id == assistido.id
        }
    }
    
    func carregarFilmes(completion: @escaping () -> Void) {
  
        let group = DispatchGroup()
        
        for genero in service.filmesLancamentos.keys {
            group.enter()
            service.fetchDiscoverLancamentos(genre: genero) { filmes in
                self.service.filmesLancamentos[genero] = filmes

                group.leave()
            }
        }
        group.notify(queue: .main) {
            completion()
        }
    }
    
    func getImage(section: Int, row: Int) -> Data {
        let movie = Array(service.filmesLancamentos.values)[section][row]
        
        if movie.posterImage == Data() {
            service.getImageFromUrl(movie: movie) { image in
                movie.posterImage = image
            }
        }
        return movie.posterImage
    }
}
