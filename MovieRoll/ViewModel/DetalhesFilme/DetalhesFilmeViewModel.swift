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
        return String(movie.releaseDate.dropLast(6))
    }
    
    func getGenero() -> String {
        if movie.genreIds.count > 0 {
            
            switch movie.genreIds[0] {
            case 28,80,36,10752,37:
                return "Ação"
            case 12:
                return "Aventura"
            case 35:
                return "Comédia"
            case 18:
                return "Drama"
            case 53,9648:
                return "Suspense"
            case 878,14:
                return "Ficção"
            case 16,10751,10402,10770:
                return "Família"
            case 10749:
                return "Romance"
            case 27:
                return "Terror"
            default:
                return "Múltiplos Gêneros"
            }
            
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
    
    func buttonAssistidoPressed() {
        if foiAssistido {
            service.removeDaListaAssistidos(movie: movie)
        } else {
            service.adicionaNaListaAssistidos(movie: movie)
        }
        foiAssistido = !foiAssistido
        delegate?.alteraAssistidoButton()
    }
    
    func buttonFavoritoPressed() {
        if ehFavorito {
            service.removeDaListaFavoritos(movie: movie)
        } else {
            service.adicionaNaListaFavoritos(movie: movie)
        }
        ehFavorito = !ehFavorito
        delegate?.alteraFavoritoButton()
    }
}
