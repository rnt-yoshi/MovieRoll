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
    
    private let coreDataService = CoreDataService()
    
    
    
    //MARK: - Funções Públicas
    func numberOfItems(segmentedControlIndex: Int) -> Int {
        if segmentedControlIndex == 0 {
//            let roletados = coreDataService.pegarListaDeRoletadosNoCoreData()
//            return roletados.count
        }
        if segmentedControlIndex == 1 {
            let favoritos = coreDataService.pegarListaDeFavoritosNoCoreData()
            return favoritos.count
        }
        if segmentedControlIndex == 2 {
            let assistidos = coreDataService.pegarListaDeAssistidosNoCoreData()
            return assistidos.count
        }
        return 0
    }
    
    func retornaFilme(indexFilme: Int, indexSegmenterController: Int) -> Movie {
        if indexSegmenterController == 0 {
            let filmeRoletado = coreDataService.pegarListaDeRoletadosNoCoreData()
            return coreDataMovieToMovie(coreDataMovie: filmeRoletado[indexFilme])
        }
        if indexSegmenterController == 1 {
            let filmeFavorito = coreDataService.pegarListaDeFavoritosNoCoreData()
            return coreDataMovieToMovie(coreDataMovie: filmeFavorito[indexFilme])
        }
        if indexSegmenterController == 2 {
            let filmeAssistido = coreDataService.pegarListaDeFavoritosNoCoreData()
            return coreDataMovieToMovie(coreDataMovie: filmeAssistido[indexFilme])
        }
        return Movie()
    }
    
    
    
   private func coreDataMovieToMovie(coreDataMovie: MovieFavorite) -> Movie {
        
        let movie = Movie()
        
        movie.id = Int(coreDataMovie.id)
        movie.title = coreDataMovie.title ?? ""
        movie.overview = coreDataMovie.overview ?? ""
        movie.posterImage = coreDataMovie.posterImage ?? Data()
        movie.voteAverage = coreDataMovie.voteAverage
        movie.releaseDate = coreDataMovie.releaseDate ?? ""
        movie.genreIds = coreDataMovie.genreIds ?? []
        movie.providersId = coreDataMovie.providersId ?? []
        
        return movie
    }
    
   private func coreDataMovieToMovie(coreDataMovie: MovieWatched) -> Movie {
        
        let movie = Movie()
        
        movie.id = Int(coreDataMovie.id)
        movie.title = coreDataMovie.title ?? ""
        movie.overview = coreDataMovie.overview ?? ""
        movie.posterImage = coreDataMovie.posterImage ?? Data()
        movie.voteAverage = coreDataMovie.voteAverage
        movie.releaseDate = coreDataMovie.releaseDate ?? ""
        movie.genreIds = coreDataMovie.genreIds ?? []
        movie.providersId = coreDataMovie.providersId ?? []
        
        return movie
    }
    
    private func coreDataMovieToMovie(coreDataMovie: MovieRolls) -> Movie {
        
        let movie = Movie()
        
        movie.id = Int(coreDataMovie.id)
        movie.title = coreDataMovie.title ?? ""
        movie.overview = coreDataMovie.overview ?? ""
        movie.posterImage = coreDataMovie.posterImage ?? Data()
        movie.voteAverage = coreDataMovie.voteAverage
        movie.releaseDate = coreDataMovie.releaseDate ?? ""
        movie.genreIds = coreDataMovie.genreIds ?? []
        movie.providersId = coreDataMovie.providersId ?? []
        
        return movie
    }
    
    func getCellViewModel(indexPath: IndexPath, segmentedControlIndex: Int) -> HistoricoCellViewModel? {
        var movie : Movie?
        
        if segmentedControlIndex == 0 {
            let filmeRoletado = coreDataService.pegarListaDeRoletadosNoCoreData()
            movie = coreDataMovieToMovie(coreDataMovie: filmeRoletado[indexPath.row])
        }
        if segmentedControlIndex == 1 {
            let filmeFavorito = coreDataService.pegarListaDeFavoritosNoCoreData()
            movie = coreDataMovieToMovie(coreDataMovie: filmeFavorito[indexPath.row])
        }
        if segmentedControlIndex == 2 {
            let filmeAssistido = coreDataService.pegarListaDeAssistidosNoCoreData()
            movie = coreDataMovieToMovie(coreDataMovie: filmeAssistido[indexPath.row])
        }
        return HistoricoCellViewModel(movie: movie)
    }
    
    func verificaFavorito(movie: Movie) -> Bool {
        return coreDataService.pegarListaDeFavoritosNoCoreData().contains { favorito in
            favorito.id == movie.id
        }
    }
    
    func verificaAssistido(movie: Movie) -> Bool {
        return coreDataService.pegarListaDeAssistidosNoCoreData().contains { assistido in
            movie.id == assistido.id
        }
    }
}
