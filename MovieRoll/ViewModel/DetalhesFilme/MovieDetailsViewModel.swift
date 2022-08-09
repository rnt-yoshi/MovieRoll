//
//  DetalhesFilmeViewModel.swift
//  MovieRoll
//
//  Created by Vitor Henrique Barreiro Marinho on 04/06/22.
//

import Foundation

protocol MovieDetailsViewModelDelegate {
    func changeFavoriteMovieButton()
    func changeWatchedMovieButton()
}

class MovieDetailsViewModel {
    
    //MARK: - Private Properties
    
    private let movie: Movie
    private var ehFavorito: Bool
    private var foiAssistido: Bool
    
    private let service: Service = .init()
    
    private let coreDataService: CoreDataService = .init()
    
    private var moviesFavorite: [MovieFavorite] = []
    private var moviesWatched: [MovieWatched] = []
    
    init(movie: Movie, ehFavorito: Bool, foiAssistido: Bool) {
        self.movie = movie
        self.ehFavorito = ehFavorito
        self.foiAssistido = foiAssistido
    }
    
    //MARK: - Public Properties
    
    var delegate: MovieDetailsViewModelDelegate?
    
    var getPosterImage: Data {
        return movie.posterImage
    }
    
    var getName: String {
        return movie.title
    }
    
    var getYear: String {
        return String(movie.releaseDate.dropLast(6))
    }
    
    var getGenre: String {
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
    
    var getMovieNote: String {
        return String(movie.voteAverage)
    }
    
    var getSynopsis: String {
        return movie.overview
    }
    
    var getPlataforma: String {
        for provider in service.filterProvider {
            if movie.providersId.contains(provider) {
                return String(provider)
            }
        }
        if movie.providersId.count > 0 {
            return String(movie.providersId[0])
        }
        return ""
    }
    
    var getFavoriteButtonImage: String {
        if ehFavorito {
            return "heart"
        } else {
            return "heartnil"
        }
    }
    
    var getWatchedButtonImage: String {
        if foiAssistido {
            return "checkgreen"
        } else {
            return "check"
        }
    }
    
    //MARK: - Public Methods
    
    func watchedButtonPressed() {
        if foiAssistido {
            let filmeParaRemover = getFilmeAssistidoParaRemover(movie: movie)
            coreDataService.removerFilmeAssistidoCoreData(coreDataMovie: filmeParaRemover)
        } else {
            coreDataService.adicionarFilmeAssistidoCoreData(movie: movie)
            
        }
        foiAssistido = !foiAssistido
        delegate?.changeWatchedMovieButton()
    }
    
    func FavoriteButtonPressed() {
        if ehFavorito {
            
            let filmeParaRemover = getFilmeFavoritoParaRemover(movie: movie)
            coreDataService.removerFilmeFavoritoCoreData(coreDataMovie: filmeParaRemover)
        } else {
            coreDataService.adicionarFilmeFavoritoCoreData(movie: movie)
        }
        ehFavorito = !ehFavorito
        delegate?.changeFavoriteMovieButton()
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
