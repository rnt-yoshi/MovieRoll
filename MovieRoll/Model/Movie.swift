//
//  Movie.swift
//  MovieRoll
//
//  Created by Vitor Henrique Barreiro Marinho on 10/06/22.
//

import Foundation


class MoviesResult: Codable {
    
    let results: [Movie]
}

class Movie: Codable {
    
    var id: Int = 0
    var title: String = ""
    var overview: String = ""
    var posterPath: String = ""
    var voteAverage: Float = 0.0
    var releaseDate: String = ""
    var genreIds: [Int] = []
    var providersId: [Int] = []
    var ageId: [Int] = []
    
    init(){}
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case releaseDate = "release_date"
        case genreIds = "genre_ids"
    }
}
