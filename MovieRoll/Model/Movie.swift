//
//  Movie.swift
//  MovieRoll
//
//  Created by Vitor Henrique Barreiro Marinho on 10/06/22.
//

import Foundation


struct MoviesResult: Codable {
    
    let results: [Movie]
}

struct Movie: Codable {
    
    let id: Int
    let title: String
    let overview: String
    let posterPath: String
    let voteAverage: Float
    let releaseDate: String
    let genreIds: [Int]
    var providersId: [Int] = []
    let ageId: [Int] = []
    
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
