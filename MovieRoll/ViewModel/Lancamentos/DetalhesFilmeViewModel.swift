//
//  DetalhesFilmeViewModel.swift
//  MovieRoll
//
//  Created by Vitor Henrique Barreiro Marinho on 04/06/22.
//

import Foundation

class DetalhesFilmeViewModel {
    
    private let filme:Filme
    
    init(filme:Filme) {
        
        self.filme = filme
    }
    
    
    var getPoster:String {
        
        return filme.image
    }
    
    
    var getAno:String {
        
        return String(filme.ano)
    }
    
    
    var getGenero:String {
        
        return filme.genero
    }
    
    var getNotaFilme:String {
        
        return String(filme.nota)
    }
    
    
    var getSinopse:String {
        
        return filme.sinopse
    }
    
    
    var getClassificacaoIndicativaImage:String {
        
        return filme.classificaIndicativaImage
    }
    
    
    var getClassificacaoIndicativa:String {
        
        return filme.classificacaoIndicativa
    }
    
    var getPlataforma:String {
        
        return filme.plataforma
    }
    
}
