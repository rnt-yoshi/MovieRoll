//
//  Network.swift
//  MovieRoll
//
//  Created by Vitor Henrique Barreiro Marinho on 10/06/22.
//

//import Foundation
//
//var moviesList = [Result]()
//
//class Network {
//
//    func fetchMoviesData () {
//
//        let key = "7f90c16b1428bbd2961cbdfd637dba99"
//
//        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=\(key)&language=pt-US&page=1") else {return}
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let data = data {
//                do {
//                    let discover = try JSONDecoder().decode(MovieResult.self, from: data)
//                    moviesList = discover.results
//                } catch let error {
//                    print (error.localizedDescription)
//                    return
//                }
//            }
//        } .resume()
//    }
//}









