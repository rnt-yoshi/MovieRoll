//
//  RoletaViewModel.swift
//  MovieRoll
//
//  Created by Artur Franca on 04/06/22.
//

import Foundation

protocol RoletaViewModelDelegate {
    func carregaFilme(movie: Movie)
    func estrelaVazia(tag: Int)
    func estrelaCheia(tag: Int)
    func botaoGeneroSelecionado(tag: Int)
    func botaoGeneroSemSelecao(tag: Int)
    func exibirAlerta()
}

class RoletaViewModel {
    //MARK: - Variaveis
    var delegate: RoletaViewModelDelegate?
    private let service = Service.shared
    
    private var anos: [[String]] = [
        [
            "De:"
        ],
        [
            "2022",
            "2021",
            "2020",
            "2010",
            "2000",
            "1990",
            "1980",
            "1970",
            "1960",
            "1950",
            "1940",
            "1930"
        ],
        [
            "Até:"
        ],
        [
            "2022",
            "2021",
            "2020",
            "2010",
            "2000",
            "1990",
            "1980",
            "1970",
            "1960",
            "1950",
            "1940",
            "1930"
        ]
    ]
    private var notasFiltrosEstrela = 0
    private var generosFiltro: [String] = []
    private var plataformaFiltro: [String] = []
    private var dataInicial = "1930"
    private var dataFinal = "2022"
    //MARK: - Variaveis computadas
    var getPlataformas: [String] {
        return service.plataformas
    }
    
    var numberOfItems: Int {
        return service.plataformas.count
    }
    
    var numberComponents: Int {
        return anos.count
    }
    //MARK: - Funções Públicas
    func getImagePlataformas(index: Int) -> String {
        return service.plataformas[index]
    }
    
    func numberOfRows(component: Int) -> Int {
        return anos[component].count
    }
    
    func titleForRow(row: Int, component: Int) -> String {
        return anos[component][row]
    }
    
    func getTitleForTextField(row: Int, componente: Int) -> String {
        if componente == 1 {
            dataInicial = anos[componente][row]
        } else if componente == 3 {
            dataFinal = anos[componente][row]
        }
        return "De \(dataInicial) Até \(dataFinal)"
    }
    
    func botaoRoletarMovie(){
        service.fetchDiscover(genre: "28", average: "5", yearLte: "2022-12-01", yearGte: "2000-12-01", provider: "8%7C119") { movie in
            DispatchQueue.main.async {
                self.delegate?.carregaFilme(movie: movie)
            }
        }
    }
    
//    func roletaFilmeFiltrado() -> Filme {
//        var filme: Filme?
//        var filmesFiltrados: [Filme] = filmesQueSeraoRoletados()
//
//        if generosFiltro.count > 0 {
//            let filmeFiltradoGenero = filtraPorGenero(generos: generosFiltro, filmes: filmesFiltrados)
//            filmesFiltrados = filmeFiltradoGenero
//        }
//
//        if notasFiltrosEstrela > 0 {
//            let filmeFiltradoNota = filtrarPorNota(nota: notasFiltrosEstrela, filmes: filmesFiltrados)
//            filmesFiltrados = filmeFiltradoNota
//        }
//        if dataInicial > anos[1].last ?? "" || dataFinal < anos[3].first ?? ""{
//            let filmeFiltradoData = filtrarPorData(dataInicial: dataInicial, dataFinal: dataFinal, filmes: filmesFiltrados)
//            filmesFiltrados = filmeFiltradoData
//        }
//        if plataformaFiltro.count > 0 {
//            let filmeFiltradoPlataforma = filtraPorPlataforma(plataformas: plataformaFiltro, filmes: filmesFiltrados)
//            filmesFiltrados = filmeFiltradoPlataforma
//        }
//
//        filme = filmesFiltrados.randomElement()
//
//        if filme == nil {
//            delegate?.exibirAlerta()
//        }
//
//        return filme ?? service.filmeNil
//    }
    
    func adicionarListaFilmesRoletados(movie: Movie?) {
        guard let movie = movie else { return }
        
        if movie.title != "" {
            service.filmesRoletados.append(movie)
        }
    }
    
    func limparFiltroDaData() {
        dataInicial = "1930"
        dataFinal = "2022"
    }
    
    func generoPressionado(_ genero: String?, alpha: Float, tag: Int) {
        guard let genero = genero else { return }
        if alpha == 1 {
            generosFiltro.append(genero)
            delegate?.botaoGeneroSelecionado(tag: tag)
        } else {
            generosFiltro.removeAll { generoFiltro in
                return genero == generoFiltro
            }
            delegate?.botaoGeneroSemSelecao(tag: tag)
        }
    }
    
    func estrelaNotaPressionada(_ tag: Int) {
        for index in 0...4 {
            if index > tag {
                delegate?.estrelaVazia(tag: index)
                
            } else {
                delegate?.estrelaCheia(tag: index)
            }
        }
        notasFiltrosEstrela = tag * 2
    }
    
    func adicionaPlataformaFiltro(indexPath: IndexPath) {
        let plataforma = service.plataformas[indexPath.item]
        plataformaFiltro.append(plataforma)
    }
    
    func removePlataformaFiltro(indexPath: IndexPath) {
        let plataforma = service.plataformas[indexPath.item]
        plataformaFiltro.removeAll { plataformaFiltro in
            return  plataforma == plataformaFiltro
        }
    }
    
    func verificaFavorito(movie: Movie) -> Bool {
        return service.filmesFavoritos.contains { filmeFavorito in
            movie.title == filmeFavorito.title
        }
    }
    
    func verificaAssistido(movie: Movie) -> Bool {
        return service.filmesAssistidos.contains { filmeFavorito in
            movie.title == filmeFavorito.title
        }
    }
}
//MARK: - Filtros da roleta: Funções privadas
//extension RoletaViewModel {
//
//    private func filtraPorGenero(generos: [String], filmes: [Filme]) -> [Filme] {
//        var filme: [Filme] = []
//
//        for genero in generos {
//            let filmesFiltrados = filmes.filter { filme in
//                filme.genero == genero
//            }
//            filme.append(contentsOf: filmesFiltrados)
//        }
//        return filme
//    }
//
//    private func filtrarPorNota(nota: Int, filmes: [Filme]) -> [Filme] {
//        let filmesNota = filmes.filter { filmesNota in
//            filmesNota.nota >= notasFiltrosEstrela
//        }
//        return filmesNota
//    }
//
//    private func filtrarPorData(dataInicial: String, dataFinal: String, filmes: [Filme]) -> [Filme] {
//        let filmesData = filmes.filter { filmesData in
//            filmesData.ano >= dataInicial && filmesData.ano <= dataFinal
//        }
//        return filmesData
//    }
//
//    private func filtraPorPlataforma(plataformas: [String], filmes: [Filme]) -> [Filme]{
//        var filme: [Filme] = []
//
//        for plataforma in plataformas {
//            let filmesFiltradosPlataforma = filmes.filter { filme in
//                filme.plataforma == plataforma
//            }
//            filme.append(contentsOf: filmesFiltradosPlataforma)
//        }
//        return filme
//    }
//
//    private func filmesQueSeraoRoletados() -> [Filme] {
//        var filmesARoletar = service.filmes
//
//        for roletado in service.filmesRoletados {
//            filmesARoletar.removeAll { filme in
//                roletado.nome == filme.nome
//            }
//        }
//        return filmesARoletar
//    }
//}
