//
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
    
    var movies: [Movie] = []

    let plataformas: [String] = [
        "appletv",
        "disneyplus",
        "globoplay",
        "hbomax",
        "netflix",
        "paramont",
        "primevideo",
        "starplus",
        "telecine"
    ]
    
    let generos: [String] = [
        "Ação",
        "Aventura",
        "Comédia",
        "Drama",
        "Documentário",
        "Ficção",
        "Infantil",
        "Romance",
        "Terror",
    ]
    
    init() {
//        for genero in generos{
//            filmesLancamentos.append(filtraPorGenero(genero: genero))
//        }
    }
    //MARK: - Funções privadas
//    private func filtraPorGenero(genero: String) -> [Filme] {
//        let filmesFiltradosGenero = filmes.filter { filme in
//            return filme.genero == genero
//        }
//        return filmesFiltradosGenero
//    }
    
    //MARK: - Funções públicas
    func adicionaNaListaFavoritos(movie: Movie) {
        filmesFavoritos.append(movie)
    }
    
    func adicionaNaListaAssistidos(movie: Movie) {
        filmesAssistidos.append(movie)
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
    
    func fetchDiscover(genre: String, average: String, yearLte: String, yearGte: String, provider: String, completion: @escaping (Movie) -> Void) {
        guard let url = URL(string: "https://api.themoviedb.org/3/discover/movie?api_key=7f90c16b1428bbd2961cbdfd637dba99&language=pt-BR&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&primary_release_date.gte=\(yearGte)&primary_release_date.lte=\(yearLte)&vote_average.gte=\(average)&with_genres=\(genre)&with_watch_providers=\(provider)&watch_region=BR&with_watch_monetization_types=flatrate") else { return }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            
            do {
                let movies = try decoder.decode(MoviesResult.self, from: data)
                self.movies = movies.results
                guard let movie = self.movies.randomElement() else { return }
                self.fetchProvidersBy(id: movie.id) { providerId in
                    movie.providersId.append(providerId)
                }
                completion(movie)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    func fetchProvidersBy(id: Int, completion: @escaping (Int) -> Void ) {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)/watch/providers?api_key=7f90c16b1428bbd2961cbdfd637dba99") else { return }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { data, _, error in
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            
            do {
                let providers = try decoder.decode(Provider.self, from: data)
                completion(providers.providerId)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
