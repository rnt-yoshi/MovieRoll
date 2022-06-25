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
        return movie?.posterImage ?? Data()
    }
}

