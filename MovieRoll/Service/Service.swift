//  Service.swift
//  MovieRoll
//
//  Created by Raul Felippe on 04/06/22.
//

import Foundation

class Service {
    
    //MARK: - Private Properties
    
    private let coreDataService: CoreDataService = .init()
    private let sortBy = [
        "revenue.desc",
        "popularity.desc",
        "original_title.asc",
        "vote_count.desc"
    ]
    private var sortByRandom: String {
        guard let sort = sortBy.randomElement() else { return ""}
        return sort
    }
    
    //MARK: - Public Properties
    
    var movies: [Movie] = []
    
    var plataformaFiltro: [Int] = []
    
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
    
    let generos: [String: String] = [
        "28": "Ação",
        "878": "Ficção",
        "53": "Suspense",
        "27": "Terror",
        "12": "Aventura",
        "18": "Drama",
        "10751": "Família",
        "10749": "Romance",
        "35": "Comédia"
    ]
    
    //MARK: - Public Methods
    
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
        guard let url = URL(string: "https://api.themoviedb.org/3/discover/movie?api_key=7f90c16b1428bbd2961cbdfd637dba99&language=pt-BR&include_adult=false&include_video=false&page=1&primary_release_date.gte=2021-10-01&primary_release_date.lte=2022-12-12&with_genres=\(genre)&with_watch_providers=350%7C337%7C307%7C384%7C8%7C531%7C119%7C619%7C227&watch_region=BR&with_watch_monetization_types=flatrate") else { return }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            
            do {
                let movies = try decoder.decode(MoviesResult.self, from: data)
                self.movies = movies.results
                self.setImages()
                completion(self.movies)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    func getImageFromUrl(movie: Movie, completion: @escaping (Data) -> Void )  {
        let url = "https://image.tmdb.org/t/p/w500\(movie.posterPath)"
        
        guard let urlImage =  URL(string: url) else { return }
        
        guard let imageData = try? Data(contentsOf: urlImage) else { return }
        
        completion(imageData)
    }
    
    //MARK: - Private Methods
    
    private func removeAssistidosDaListaMovies() {
        let assistidos = coreDataService.pegarListaDeAssistidosNoCoreData()
        for assistido in assistidos {
            movies.removeAll { movie in
                assistido.id == movie.id
            }
        }
    }
    
    private func removeFavoritosDaListaMovies() {
        let favoritos = coreDataService.pegarListaDeFavoritosNoCoreData()
        for favorito in favoritos {
            movies.removeAll { movie in
                return favorito.id == movie.id
            }
        }
    }
    
    private func removeRoletadosDaListaMovies() {
        let roletados = coreDataService.pegarListaDeRoletadosNoCoreData()
        for roletado in roletados {
            movies.removeAll { movie in
                return roletado.id == movie.id
            }
        }
    }
    
    private func setProviderIds(flatrate: [Flatrate]) -> [Int] {
        var providersId: [Int] = []
        for item in flatrate {
            providersId.append(item.providerId)
        }
        return providersId
    }
    
    private func setImages() {
        while movies.count > 6 {
            movies.removeLast()
        }
        
        for movie in movies {
            
            let url = "https://image.tmdb.org/t/p/w500\(movie.posterPath)"
            
            guard let urlImage =  URL(string: url) else { return }
            
            guard let imageData = try? Data(contentsOf: urlImage) else { return }
            
            movie.posterImage = imageData
        }
    }
    
}
