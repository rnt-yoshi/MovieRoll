//
//  DetalhesFilmeViewModel.swift
//  MovieRoll
//
//  Created by Vitor Henrique Barreiro Marinho on 04/06/22.
//

import Foundation

protocol DetalhesFilmeViewModelDelegate {
    func alteraFavoritoButton()
    func alteraAssistidoButton()
}

class DetalhesFilmeViewModel {
    
    private let service = Service()
    
    private let filme: Filme
    var ehFavorito: Bool
    var foiAssistido: Bool
    
    var delegate: DetalhesFilmeViewModelDelegate?
    
    init(filme: Filme, ehFavorito: Bool, foiAssistido: Bool) {
        self.filme = filme
        self.ehFavorito = ehFavorito
        self.foiAssistido = foiAssistido
    }
    
    var getPoster:String {
        return filme.image
    }
    
    var getNome:String {
        return filme.nome
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
    
    func getFavoritarButtonImage() -> String {
        if ehFavorito {
            return "heart"
        } else {
            return "heartnil"
        }
    }
    
    func getAssistidoButtonImage() -> String {
        if foiAssistido {
            return "checkgreen"
        } else {
            return "check"
        }
    }

    func buttonAssistidoPressed() {
        if foiAssistido {
            service.filmesAssistidos.removeAll { filmeAssistido in
                filme.nome == filmeAssistido.nome
            }
        } else {
            service.filmesAssistidos.append(filme)
        }
        foiAssistido = !foiAssistido
        delegate?.alteraAssistidoButton()
    }
    
    func buttonFavoritoPressed() {
        if ehFavorito {
            service.filmesFavoritos.removeAll { filmeFavorito in
                filme.nome == filmeFavorito.nome
            }
        } else {
            service.filmesFavoritos.append(filme)
        }
        ehFavorito = !ehFavorito
        delegate?.alteraFavoritoButton()

    }
}
