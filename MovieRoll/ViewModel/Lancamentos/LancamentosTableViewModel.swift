//
//  LancamentosTableViewModel.swift
//  MovieRoll
//
//  Created by Raul Felippe on 04/06/22.
//

import Foundation

class LancamentosTableViewModel {
    
    var service = Service()
    
    var numberOfSection: Int {
        return service.generos.count
    }
    
    func numberOfItems(section: Int) -> Int {
        //fazer filtro de genero
        //        let filmesFiltrado = service.filmes.filter { filmes in
        //            service.generos[section]
        //        }
        
        let filmesFiltrado = service.filmes
        
        return filmesFiltrado.count
    }
    
    func retornaTitulo(section: Int) -> String {
        return service.generos[section]
    }
    
    func retornaFilmes(index: Int) -> Filme {
        
        return service.filmes[index]
    }
    
    func getCellViewModel(index: Int) -> UmLancamentoCollectionViewModel {
        let filme = service.filmes[index]
        
        let cellViewModel = UmLancamentoCollectionViewModel(filme: filme)
        
        return cellViewModel
    }
    
    
}
