//
//  HistoricoViewModel.swift
//  MovieRoll
//
//  Created by Renato Yoshinari on 06/06/22.
//

import Foundation
import UIKit

protocol HistoricoViewModelDelegate {
    
    func reloadCollectionView()
}

class HistoricoViewModel {
    
    //MARK: - Private Properties
    
    private let coreDataService = CoreDataService()
    
    private var filteredRollMovies: [MovieRolls] = []
    private var filteredFavoriteMovies: [MovieFavorite] = []
    private var filteredWatcheMovies: [MovieWatched] = []
    
    
    //MARK: - Public Properties
    
    var delegate: HistoricoViewModelDelegate?

    //MARK: - Public Methods
    
    func loadMovies(){
        filteredRollMovies = coreDataService.pegarListaDeRoletadosNoCoreData()
        filteredFavoriteMovies = coreDataService.pegarListaDeFavoritosNoCoreData()
        filteredWatcheMovies = coreDataService.pegarListaDeAssistidosNoCoreData()

    }
    
    func searchResults(searchController: UISearchController){
        
        guard let searchText = searchController.searchBar.text else { return }
        
        let rollMovies = coreDataService.pegarListaDeRoletadosNoCoreData()
        let FavoriteMovies = coreDataService.pegarListaDeFavoritosNoCoreData()
        let WatchedMovies = coreDataService.pegarListaDeAssistidosNoCoreData()
        
        if searchText.isEmpty{
            filteredRollMovies = rollMovies
            filteredFavoriteMovies = FavoriteMovies
            filteredWatcheMovies = WatchedMovies
            
        }else {
            
            filteredRollMovies = rollMovies.filter { movie in
                movie.title?.range(of: searchText, options: .caseInsensitive) != nil
            }
            filteredFavoriteMovies = FavoriteMovies.filter { movie in
                movie.title?.range(of: searchText, options: .caseInsensitive) != nil
            }
            
            filteredWatcheMovies = WatchedMovies.filter { movie in
                movie.title?.range(of: searchText, options: .caseInsensitive) != nil
            }
        }
        delegate?.reloadCollectionView()
        
    }
    
    func numberOfItems(segmentedControlIndex: Int) -> Int {
        if segmentedControlIndex == 0 {
            let roletados = filteredRollMovies
            return roletados.count
        }
        if segmentedControlIndex == 1 {
            let favoritos = filteredFavoriteMovies
            return favoritos.count
        }
        if segmentedControlIndex == 2 {
            let assistidos = filteredWatcheMovies
            return assistidos.count
        }
        return 0
    }
    
    func retornaFilme(indexFilme: Int, indexSegmenterController: Int) -> Movie {
        if indexSegmenterController == 0 {
            let filmeRoletado = filteredRollMovies
            return coreDataMovieToMovie(coreDataMovie: filmeRoletado[indexFilme])
        }
        if indexSegmenterController == 1 {
            let filmeFavorito = filteredFavoriteMovies
            return coreDataMovieToMovie(coreDataMovie: filmeFavorito[indexFilme])
        }
        if indexSegmenterController == 2 {
            let filmeAssistido = filteredWatcheMovies
            return coreDataMovieToMovie(coreDataMovie: filmeAssistido[indexFilme])
        }
        return Movie()
    }
    
    func getCellViewModel(indexPath: IndexPath, segmentedControlIndex: Int) -> HistoricoCellViewModel? {
        var movie : Movie?
        
        if segmentedControlIndex == 0 {
            let filmeRoletado = filteredRollMovies
            movie = coreDataMovieToMovie(coreDataMovie: filmeRoletado[indexPath.row])
        }
        if segmentedControlIndex == 1 {
            let filmeFavorito = filteredFavoriteMovies
            movie = coreDataMovieToMovie(coreDataMovie: filmeFavorito[indexPath.row])
        }
        if segmentedControlIndex == 2 {
            let filmeAssistido = filteredWatcheMovies
            movie = coreDataMovieToMovie(coreDataMovie: filmeAssistido[indexPath.row])
        }
        return HistoricoCellViewModel(movie: movie)
    }
    
    func verificaFavorito(movie: Movie) -> Bool {
        return filteredFavoriteMovies.contains { favorito in
            favorito.id == movie.id
        }
    }
    
    func verificaAssistido(movie: Movie) -> Bool {
        return filteredWatcheMovies.contains { assistido in
            movie.id == assistido.id
        }
    }
    
    //MARK: - Private Methods
    
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
    
}
