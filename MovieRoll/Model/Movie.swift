//
//  Movie.swift
//  MovieRoll
//
//  Created by Vitor Henrique Barreiro Marinho on 10/06/22.
//

import Foundation


struct MovieResult: Decodable {
    
    let results: [Result]
}

struct Result: Decodable {
    
    let id: Int
    let original_language: String
    let original_title: String
    let title: String
    let overview: String
    let popularity: Double
    let poster_path: String
    let vote_average: Float
    let vote_count:Int
    let release_date:String
    let video: Bool
}
