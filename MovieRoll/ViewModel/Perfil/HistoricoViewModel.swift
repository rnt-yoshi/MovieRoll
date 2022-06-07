//
//  HistoricoViewModel.swift
//  MovieRoll
//
//  Created by Renato Yoshinari on 06/06/22.
//

import Foundation

class HistoricoViewModel {
    
    private var listaDeFilmesRoletados:  [Filme] = []
    private var listaDeFilmesFavoritos:  [Filme] = []
    private var listaDeFilmesAssistidos: [Filme] = []
    
    let service = Service()
    
    init() {
        listaDeFilmesRoletados = service.filmesRoletados
        listaDeFilmesFavoritos = service.filmesFavoritos
        listaDeFilmesAssistidos = service.filmesAssistidos
    }
    
    func numberOfItems(segmentedControlIndex: Int) -> Int {
        if segmentedControlIndex == 0 {
            return listaDeFilmesRoletados.count
        }
        if segmentedControlIndex == 1 {
            return listaDeFilmesFavoritos.count
        }
        if segmentedControlIndex == 2 {
            return listaDeFilmesAssistidos.count
        }
        return 0
    }
    
    func retornaFilme(indexFilme: Int, indexSegmenterController: Int) -> Filme {
        if indexSegmenterController == 0 {
            return listaDeFilmesRoletados[indexFilme]
        }
        if indexSegmenterController == 1 {
            return listaDeFilmesFavoritos[indexFilme]
        }
        if indexSegmenterController == 2 {
            return listaDeFilmesAssistidos[indexFilme]
        }
        return service.filmeNil
    }
    
    
    func getCellViewModel(indexPath: IndexPath, segmentedControlIndex: Int) -> HistoricoCellViewModel {
        var filme = listaDeFilmesRoletados[indexPath.row]
        
        if segmentedControlIndex == 0 {
            filme = listaDeFilmesRoletados[indexPath.row]
        }
        if segmentedControlIndex == 1 {
            filme = listaDeFilmesFavoritos[indexPath.row]
        }
        if segmentedControlIndex == 2 {
            filme = listaDeFilmesAssistidos[indexPath.row]
        }
        return HistoricoCellViewModel(filme: filme)
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
