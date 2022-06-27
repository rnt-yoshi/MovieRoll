//
//  CoreDataService.swift
//  MovieRoll
//
//  Created by Raul Felippe on 25/06/22.
//

import Foundation
import UIKit
import CoreData

class CoreDataService {
    //MARK: - Private Properties

    private let contextFavorites = (UIApplication.shared.delegate as! AppDelegate).persistentContainerFavorite.viewContext
    
    private let contextWatched = (UIApplication.shared.delegate as! AppDelegate).persistentContainerWatched.viewContext
    
    private let contextRolls = (UIApplication.shared.delegate as! AppDelegate).persistentContainerRolls.viewContext
    
    
    //MARK: - Public Methods
    
    //mark: Funcs Adicionar Filme
    func adicionarFilmeFavoritoCoreData(movie: Movie) {
        let coreDataMovie: MovieFavorite = .init(context: contextFavorites)
        
        coreDataMovie.id = Int32(movie.id)
        coreDataMovie.title = movie.title
        coreDataMovie.overview = movie.overview
        coreDataMovie.posterImage = movie.posterImage
        coreDataMovie.voteAverage = movie.voteAverage
        coreDataMovie.releaseDate = movie.releaseDate
        coreDataMovie.genreIds = movie.genreIds
        coreDataMovie.providersId = movie.providersId
        
        salvarContextoFavorite()
    }
    
    func adicionarFilmeAssistidoCoreData(movie: Movie) {
        let coreDataMovie: MovieWatched = .init(context: contextWatched)
        
        coreDataMovie.id = Int32(movie.id)
        coreDataMovie.title = movie.title
        coreDataMovie.overview = movie.overview
        coreDataMovie.posterImage = movie.posterImage
        coreDataMovie.voteAverage = movie.voteAverage
        coreDataMovie.releaseDate = movie.releaseDate
        coreDataMovie.genreIds = movie.genreIds
        coreDataMovie.providersId = movie.providersId
        
        salvarContextoWatch()
    }
    
    func adicionarFilmeRoletadoCoreData(movie: Movie) {
        let coreDataMovie: MovieRolls = .init(context: contextRolls)

        coreDataMovie.id = Int32(movie.id)
        coreDataMovie.title = movie.title
        coreDataMovie.overview = movie.overview
        coreDataMovie.posterImage = movie.posterImage
        coreDataMovie.voteAverage = movie.voteAverage
        coreDataMovie.releaseDate = movie.releaseDate
        coreDataMovie.genreIds = movie.genreIds
        coreDataMovie.providersId = movie.providersId

        salvarContextoRolls()
    }
    
    //mark: Funcs pegar lista Filmes
    func pegarListaDeFavoritosNoCoreData() -> [MovieFavorite] {
        do {
            return try contextFavorites.fetch(MovieFavorite.fetchRequest())
        } catch {
            print(error)
        }
        return []
    }
    
    func pegarListaDeAssistidosNoCoreData() -> [MovieWatched] {
        do {
            return try contextWatched.fetch(MovieWatched.fetchRequest())
        } catch {
            print(error)
        }
        return []
    }
    
    func pegarListaDeRoletadosNoCoreData() -> [MovieRolls] {
        do {
            return try contextRolls.fetch(MovieRolls.fetchRequest())
        } catch {
            print(error)
        }
        return []
    }
    
    //mark: Funcs remover filme
    func removerFilmeFavoritoCoreData(coreDataMovie: MovieFavorite) {
        contextFavorites.delete(coreDataMovie)
        salvarContextoFavorite()
    }
    
    func removerFilmeAssistidoCoreData(coreDataMovie: MovieWatched) {
        contextWatched.delete(coreDataMovie)
        salvarContextoWatch()
    }
    
    func removerFilmeRoletadoCoreData(coreDataMovie: MovieRolls) {
        contextRolls.delete(coreDataMovie)
        salvarContextoRolls()
    }
    
    //MARK: - Private Methods

    private func salvarContextoFavorite() {
        let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
        appDelegate.saveContextFavorite()
    }
    
    private func salvarContextoWatch() {
        let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
        appDelegate.saveContextWatched()
    }
    
    private func salvarContextoRolls() {
        let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
        appDelegate.saveContextRolls()
    }
}
