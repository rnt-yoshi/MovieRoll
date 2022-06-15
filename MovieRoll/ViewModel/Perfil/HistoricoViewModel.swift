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
    
    func retornaFilme(indexFilme: Int, indexSegmenterController: Int) -> Filme {
        if indexSegmenterController == 0 {
            return service.filmesRoletados[indexFilme]
        }
        if indexSegmenterController == 1 {
            return service.filmesFavoritos[indexFilme]
        }
        if indexSegmenterController == 2 {
            return service.filmesAssistidos[indexFilme]
        }
        return Service.shared.filmeNil
    }
    
    func getCellViewModel(indexPath: IndexPath, segmentedControlIndex: Int) -> HistoricoCellViewModel? {
        var filme : Filme?
        
        if segmentedControlIndex == 0 {
            filme = service.filmesRoletados[indexPath.row]
        }
        if segmentedControlIndex == 1 {
            filme = service.filmesFavoritos[indexPath.row]
        }
        if segmentedControlIndex == 2 {
            filme = service.filmesAssistidos[indexPath.row]
        }
        return HistoricoCellViewModel(filme: filme)
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
