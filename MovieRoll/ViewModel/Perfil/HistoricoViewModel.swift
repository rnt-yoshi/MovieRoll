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
            return service.filmesRoletados.count
        }
        if segmentedControlIndex == 1 {
//            return  service.filmesFavoritos.count
            let favoritos = coreDataService.pegarListaDeMoviesNoCoreData()
            return favoritos.count
        }
        if segmentedControlIndex == 2 {
            return service.filmesAssistidos.count
        }
        return 0
    }
    
    func retornaFilme(indexFilme: Int, indexSegmenterController: Int) -> Movie {
        if indexSegmenterController == 0 {
            return service.filmesRoletados[indexFilme]
        }
        if indexSegmenterController == 1 {
//            return service.filmesFavoritos[indexFilme]
            let filme = coreDataService.pegarListaDeMoviesNoCoreData()
            return coreDataMovieToMovie(coreDataMovie: filme[indexFilme])
        }
        if indexSegmenterController == 2 {
            return service.filmesAssistidos[indexFilme]
        }
        return Movie()
    }
    
    func coreDataMovieToMovie(coreDataMovie: CoreDataMovie) -> Movie {
        
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
            movie = service.filmesRoletados[indexPath.row]
        }
        if segmentedControlIndex == 1 {
//            movie = service.filmesFavoritos[indexPath.row]
            let filme = coreDataService.pegarListaDeMoviesNoCoreData()
            movie = coreDataMovieToMovie(coreDataMovie: filme[indexPath.row])
        }
        if segmentedControlIndex == 2 {
            movie = service.filmesAssistidos[indexPath.row]
        }
        return HistoricoCellViewModel(movie: movie)
    }
    
    func verificaFavorito(movie: Movie) -> Bool {
//        return Service.shared.filmesFavoritos.contains { filmeFavorito in
//            movie.title == filmeFavorito.title
//        }
        return coreDataService.pegarListaDeMoviesNoCoreData().contains { filmeCoreData in
            filmeCoreData.id == movie.id
        }
    }

    func verificaAssistido(movie: Movie) -> Bool {
        return Service.shared.filmesAssistidos.contains { filmeFavorito in
            movie.title == filmeFavorito.title
        }
    }
}
