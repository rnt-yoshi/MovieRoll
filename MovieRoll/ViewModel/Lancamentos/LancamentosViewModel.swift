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
    //MARK: - Private Properties
    
    private let service: Service = .init()
    private let coreDataService: CoreDataService = .init()
    
    private var filmesLancamentos: [String: [Movie]] = [
        "28": [],
        "878": [],
        "53": [],
        "27": [],
        "12": [],
        "18": [],
        "10751": [],
        "10749": [],
        "35": []
    ]
    
    //MARK: - Public Properties
    
    var delegate: LancamentosViewModelDelegate?

    var numberOfRows: Int {
            return 1
    }
    
    var numberOfSection: Int {
        guard let first = filmesLancamentos.values.first  else { return 0 }
        if first.count > 0 {
            return filmesLancamentos.count
        }
        return 0
    }
    
    //MARK: - Public Methods
    
    func numberOfItems(section: Int) -> Int {
        return Array(filmesLancamentos.values)[section].count

    }
    
    func retornaTitulo(section: Int) -> String {
        let chave = Array(filmesLancamentos.keys)[section]
        return service.generos[chave] ?? ""
    }
    
    func retornaFilmes(row: Int, section: Int) -> Movie {
    
        return Array(filmesLancamentos.values)[section][row]
    }
    
    func setProvidersDataImage(row: Int, section: Int) {
        let group = DispatchGroup()
        
        let movie = Array(filmesLancamentos.values)[section][row]
        
        group.enter()
        setProviders(movie: movie) {
            group.leave()
        }
   
        group.enter()
        setDataImage(movie: movie) {
            group.leave()
        }
        
        group.notify(queue: .main) {
            self.delegate?.didSelectItem(movie: movie)
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
        
        for genero in filmesLancamentos.keys {
            group.enter()
            service.fetchDiscoverLancamentos(genre: genero) { filmes in
                self.filmesLancamentos[genero] = filmes

                group.leave()
            }
        }
        group.notify(queue: .main) {
            completion()
        }
    }
    
    func getImage(section: Int, row: Int) -> URL {
        let movie = Array(filmesLancamentos.values)[section][row]
        let url = service.getUrl(movie: movie)
        
        return url
    }
    
    //MARK: - Private Methods
    
    private func setProviders(movie: Movie, completion: @escaping () -> Void) {
        service.fetchProvidersBy(id: movie.id) { providers in
                movie.providersId = providers
            completion()
        }
    }
    
    private func setDataImage(movie: Movie, completion: @escaping () -> Void) {
        service.getImageFromUrl(movie: movie) { image in
            movie.posterImage = image
            completion()
        }
    }

}
