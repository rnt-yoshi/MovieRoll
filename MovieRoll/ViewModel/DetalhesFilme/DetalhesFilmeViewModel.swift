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
    
    //MARK: - Private Properties
    
    private let movie: Movie
    private var ehFavorito: Bool
    private var foiAssistido: Bool
    
    private let service = Service.shared
    
    private let coreDataService = CoreDataService()
    
    private var moviesFavorite: [MovieFavorite] = []
    private var moviesWatched: [MovieWatched] = []
    
    init(movie: Movie, ehFavorito: Bool, foiAssistido: Bool) {
        self.movie = movie
        self.ehFavorito = ehFavorito
        self.foiAssistido = foiAssistido
    }
    
    //MARK: - Public Properties
    
    var delegate: DetalhesFilmeViewModelDelegate?
    
    var getPosterImage: Data {
        return movie.posterImage
    }
    
    var getNome: String {
        return movie.title
    }
    
    var getAno: String {
        return String(movie.releaseDate.dropLast(6))
    }
    
    var getGenero: String {
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
            case 99:
                generoExibido += ", Documentário"
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
    
    var getPlataforma: String {
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
    
    var getFavoritarButtonImage: String {
        if ehFavorito {
            return "heart"
        } else {
            return "heartnil"
        }
    }
    
    var getAssistidoButtonImage: String {
        if foiAssistido {
            return "checkgreen"
        } else {
            return "check"
        }
    }
    
    //MARK: - Public Methods
    
    func buttonAssistidoPressed() {
        if foiAssistido {
            let filmeParaRemover = getFilmeAssistidoParaRemover(movie: movie)
            coreDataService.removerFilmeAssistidoCoreData(coreDataMovie: filmeParaRemover)
        } else {
            coreDataService.adicionarFilmeAssistidoCoreData(movie: movie)
            
        }
        foiAssistido = !foiAssistido
        delegate?.alteraAssistidoButton()
    }
    
    func buttonFavoritoPressed() {
        if ehFavorito {
            
            let filmeParaRemover = getFilmeFavoritoParaRemover(movie: movie)
            coreDataService.removerFilmeFavoritoCoreData(coreDataMovie: filmeParaRemover)
        } else {
            coreDataService.adicionarFilmeFavoritoCoreData(movie: movie)
        }
        ehFavorito = !ehFavorito
        delegate?.alteraFavoritoButton()
    }
    
    //MARK: - Private Methods
    
    private func getFilmeFavoritoParaRemover(movie: Movie) -> MovieFavorite {
        moviesFavorite = coreDataService.pegarListaDeFavoritosNoCoreData()
        
        return moviesFavorite.first { movieCoredata in
            movieCoredata.id == movie.id
            
        } ?? MovieFavorite()
    }
    
    private func getFilmeAssistidoParaRemover(movie: Movie) -> MovieWatched {
        moviesWatched = coreDataService.pegarListaDeAssistidosNoCoreData()
        
        return moviesWatched.first { movieCoredata in
            movieCoredata.id == movie.id
            
        } ?? MovieWatched()
    }
    
}
