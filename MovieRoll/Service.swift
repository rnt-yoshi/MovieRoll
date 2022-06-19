//  Service.swift
//  MovieRoll
//
//  Created by Raul Felippe on 04/06/22.
//

import Foundation

class Service {
    
    //MARK: - Variaveis
    static var shared = Service()
    
    var filmesLancamentos: [[Movie]] = []
    var filmesFavoritos: [Movie] = []
    var filmesRoletados: [Movie] = []
    var filmesAssistidos: [Movie] = []
    var plataformaFiltro: [Int] = []
    
    var movies: [Movie] = []
    
    let sortBy = [
        "revenue.desc",
        "popularity.desc",
        "original_title.asc",
        "vote_count.desc"
    ]
    
    var sortByRandom: String {
        guard let sort = sortBy.randomElement() else { return ""}
        return sort
    }
    
    let plataformas: [Int] = [
        350,
        337,
        307,
        384,
        8,
        531,
        119,
        619,
        227
    ]
    
    let generosId: [String] = [
        "28",
        "12",
        "35",
        "18",
        "53",
        "878",
        "10751",
        "10749",
        "27"
    ]
    
    let generos: [String] = [
        "Ação",
        "Aventura",
        "Comédia",
        "Drama",
        "Suspense",
        "Ficção",
        "Família",
        "Romance",
        "Terror",
    ]
    
    init() {
    }
    //MARK: - Funções públicas
    func adicionaNaListaFavoritos(movie: Movie) {
        filmesFavoritos.append(movie)
    }
    
    func adicionaNaListaAssistidos(movie: Movie) {
        filmesAssistidos.append(movie)
    }
    
    func adicionaNaListaRoletados(movie: Movie) {
        filmesRoletados.append(movie)
    }
    
    private func removeAssistidosDaListaMovies() {
        for assistido in filmesAssistidos {
            movies.removeAll { movie in
                return assistido.id == movie.id
            }
        }
    }
    
    private func removeFavoritosDaListaMovies() {
        for favorito in filmesRoletados {
            movies.removeAll { movie in
                return favorito.id == movie.id
            }
        }
    }
    
    private func removeRoletadosDaListaMovies() {
        for roletado in filmesRoletados {
            movies.removeAll { movie in
                return roletado.id == movie.id
            }
        }
    }
    
    func removeDaListaFavoritos(movie: Movie) {
        filmesFavoritos.removeAll { filmeFavorito in
            return movie.title == filmeFavorito.title
        }
    }
    
    func removeDaListaAssistidos(movie: Movie) {
        filmesAssistidos.removeAll { filmeAssistido in
            return movie.title == filmeAssistido.title
        }
    }
    
    private func setProviderIds(flatrate: [Flatrate]) -> [Int] {
        var providersId: [Int] = []
        for item in flatrate {
            providersId.append(item.providerId)
        }
        return providersId
    }
    
    func fetchDiscover(genre: String, _ average: String, _ yearLte: String, _ yearGte: String, provider: String, completion: @escaping ([Movie]) -> Void) {
        guard let url = URL(string: "https://api.themoviedb.org/3/discover/movie?api_key=7f90c16b1428bbd2961cbdfd637dba99&language=pt-BR&sort_by=\(sortByRandom)&include_adult=false&include_video=false&without_genres=99&page=1&primary_release_date.gte=\(yearGte)&primary_release_date.lte=\(yearLte)&vote_average.gte=\(average)&vote_average.lte=9.5&with_genres=\(genre)&with_watch_providers=\(provider)&watch_region=BR&with_watch_monetization_types=flatrate") else { return }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            
            do {
                let movies = try decoder.decode(MoviesResult.self, from: data)
                self.movies = movies.results
                self.removeRoletadosDaListaMovies()
                self.removeFavoritosDaListaMovies()
                self.removeAssistidosDaListaMovies()
                completion(self.movies)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    func fetchProvidersBy(id: Int, completion: @escaping ([Int]) -> Void ) {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)/watch/providers?api_key=7f90c16b1428bbd2961cbdfd637dba99") else { return }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { data, _, error in
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            
            do {
                let providers = try decoder.decode(Provider.self, from: data)
                let providersId = self.setProviderIds(flatrate: providers.results.br.flatrate)
                completion(providersId)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    func fetchDiscoverLancamentos(genre: String, completion: @escaping ([Movie]) -> Void) {
        guard let url = URL(string: "https://api.themoviedb.org/3/discover/movie?api_key=7f90c16b1428bbd2961cbdfd637dba99&language=pt-BR&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_genres=\(genre)&watch_region=BR&with_watch_monetization_types=flatrate") else { return }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            
            do {
                let movies = try decoder.decode(MoviesResult.self, from: data)
                self.movies = movies.results
                completion(self.movies)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
