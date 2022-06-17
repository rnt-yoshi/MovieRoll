//
//  HistoricoCellViewModel.swift
//  MovieRoll
//
//  Created by Renato Yoshinari on 06/06/22.
//

import Foundation

class HistoricoCellViewModel {
    
    private let movie: Movie?
    
    init(movie: Movie?) {
        self.movie = movie
    }
    
    func getImage() -> Data {
        guard let movie = movie else {
            return Data()
        }

        let url = "https://image.tmdb.org/t/p/w500\(movie.posterPath)"
        
        guard let urlImage =  URL(string: url) else { return Data() }
        
        guard let imageData = try? Data(contentsOf: urlImage) else { return Data() }
        
        return imageData
    }
}

