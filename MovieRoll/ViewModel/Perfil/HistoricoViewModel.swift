//
//  HistoricoViewModel.swift
//  MovieRoll
//
//  Created by Renato Yoshinari on 06/06/22.
//

import Foundation

class HistoricoViewModel {
    //MARK: - Variáveis
    private let service = Service.shared
    
    //MARK: - Funções Públicas
    func numberOfItems(segmentedControlIndex: Int) -> Int {
        if segmentedControlIndex == 0 {
            return service.filmesRoletados.count
        }
        if segmentedControlIndex == 1 {
            return  service.filmesFavoritos.count
        }
        if segmentedControlIndex == 2 {
            return service.filmesAssistidos.count
        }
        return 0
    }
    
    func retornaFilme(indexFilme: Int, indexSegmenterController: Int) -> Movie {
        if indexSegmenterController == 0 {
            return service.filmesRoletados[indexFilme]
        }
        if indexSegmenterController == 1 {
            return service.filmesFavoritos[indexFilme]
        }
        if indexSegmenterController == 2 {
            return service.filmesAssistidos[indexFilme]
        }
        return Movie()
    }
    
    func getCellViewModel(indexPath: IndexPath, segmentedControlIndex: Int) -> HistoricoCellViewModel? {
        var movie : Movie?
        
        if segmentedControlIndex == 0 {
            movie = service.filmesRoletados[indexPath.row]
        }
        if segmentedControlIndex == 1 {
            movie = service.filmesFavoritos[indexPath.row]
        }
        if segmentedControlIndex == 2 {
            movie = service.filmesAssistidos[indexPath.row]
        }
        return HistoricoCellViewModel(movie: movie)
    }
    
    func verificaFavorito(movie: Movie) -> Bool {
        return Service.shared.filmesFavoritos.contains { filmeFavorito in
            movie.title == filmeFavorito.title
        }
    }
    
    func verificaAssistido(movie: Movie) -> Bool {
        return Service.shared.filmesAssistidos.contains { filmeFavorito in
            movie.title == filmeFavorito.title
        }
    }
}
