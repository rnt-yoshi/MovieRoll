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
        var generoExibido = ""
        for generoId in movie.genreIds {
            switch generoId{
            case 28:
                generoExibido += ", Ação"
            case 12:
                generoExibido += ", Aventura"
            case 16:
                generoExibido += ", Animação"
            case 35:
                generoExibido += ", Comédia"
            case 80:
                generoExibido += ", Crime"
            case 18:
                generoExibido += ", Drama"
            case 10751:
                generoExibido += ", Família"
            case 14:
                generoExibido += ", Fantasia"
            case 36:
                generoExibido += ", História"
            case 27:
                generoExibido += ", Terror"
            case 10402:
                generoExibido += ", Música"
            case 9648:
                generoExibido += ", Mistério"
            case 10749:
                generoExibido += ", Romance"
            case 878:
                generoExibido += ", Ficção"
            case 10770:
                generoExibido += ", Cinema TV"
            case 53:
                generoExibido += ", Suspense"
            case 10752:
                generoExibido += ", Guerra"
            case 37:
                generoExibido += ", Faroeste"
            default:
                return ""
            }
        }
        return String(generoExibido.dropFirst(2))
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
    
    func getPlataforma() -> String {
        for provider in service.plataformaFiltro {
            if movie.providersId.contains(provider) {
                return String(provider)
            }
        }
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
