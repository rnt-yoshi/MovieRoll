//
//  CoreDataService.swift
//  MovieRoll
//
//  Created by Raul Felippe on 25/06/22.
//

import Foundation
import UIKit

class CoreDataService {
    
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func adicionarMovieCoreData(movie: Movie) {
        let coreDataMovie: CoreDataMovie = .init(context: context)
        
        coreDataMovie.id = Int32(movie.id)
        coreDataMovie.title = movie.title
        coreDataMovie.overview = movie.overview
        coreDataMovie.posterImage = movie.posterImage
        coreDataMovie.voteAverage = movie.voteAverage
        coreDataMovie.releaseDate = movie.releaseDate
        coreDataMovie.genreIds = movie.genreIds
        coreDataMovie.providersId = movie.providersId
        
        salvarContexto()
    }
    
    func pegarListaDeMoviesNoCoreData() -> [CoreDataMovie] {
        do {
            return try context.fetch(CoreDataMovie.fetchRequest())
        } catch {
            print(error)
        }
        return []
    }
    
    func removerMovieCoreData(coreDataMovie: CoreDataMovie) {
        context.delete(coreDataMovie)
        salvarContexto()
    }
    
    private func salvarContexto() {
        let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
        appDelegate.saveContext()
    }
}
