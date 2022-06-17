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
    //MARK: - Variáveis
    private let service = Service.shared
    
    private let movie: Movie
    var ehFavorito: Bool
    var foiAssistido: Bool
    
    var delegate: DetalhesFilmeViewModelDelegate?
    
    init(movie: Movie, ehFavorito: Bool, foiAssistido: Bool) {
        self.movie = movie
        self.ehFavorito = ehFavorito
        self.foiAssistido = foiAssistido
    }
    //MARK: - Variáveis Computadas
    
    func getPoster() -> Data {
        
        let url = "https://image.tmdb.org/t/p/w500\(movie.posterPath)"
        
        guard let urlImage =  URL(string: url) else { return Data() }
        
        guard let imageData = try? Data(contentsOf: urlImage) else { return Data() }
        
        return imageData
    }
    
    var getNome: String {
        return movie.title
    }
    
    var getAno: String {
        return movie.releaseDate
    }
    
    var getGenero: String {
        if movie.genreIds.count > 0 {
            return String(movie.genreIds[0])
        }
        
        return ""
    }
    
    var getNotaFilme: String {
        return String(movie.voteAverage)
    }
    
    var getSinopse: String {
        return movie.overview
    }
    
    var getClassificacaoIndicativaImage: String {
        if movie.ageId.count > 0 {
            return String(movie.ageId[0])
        }
        
        return ""
        
    }
    
    var getClassificacaoIndicativa: String {
        if movie.ageId.count > 0 {
            return String(movie.ageId[0])
        }
        
        return ""
    }
    
    var getPlataforma: String {
        if movie.providersId.count > 0 {
            return String(movie.providersId[0])
        }
        return ""
    }
    
    //MARK: - Funções Públicas
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
    
    //    func buttonAssistidoPressed() {
    //        if foiAssistido {
    //            service.removeDaListaAssistidos(filme: filme)
    //        } else {
    //            service.adicionaNaListaAssistidos(filme: filme)
    //        }
    //        foiAssistido = !foiAssistido
    //        delegate?.alteraAssistidoButton()
    //    }
    //
    //    func buttonFavoritoPressed() {
    //        if ehFavorito {
    //            service.removeDaListaFavoritos(filme: filme)
    //        } else {
    //            service.adicionaNaListaFavoritos(filme: filme)
    //        }
    //        ehFavorito = !ehFavorito
    //        delegate?.alteraFavoritoButton()
    //    }
}
