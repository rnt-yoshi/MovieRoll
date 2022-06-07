//
//  RoletaViewModel.swift
//  MovieRoll
//
//  Created by Artur Franca on 04/06/22.
//

import Foundation

protocol RoletaViewModelDelegate {
    func estrelaVazia(tag: Int)
    func estrelaCheia(tag: Int)
    func botaoSelecionado(tag: Int)
    func botaoSemSelecao(tag: Int)
}

class RoletaViewModel {
    
    let service = Service()
    
    var delegate: RoletaViewModelDelegate?
    
    private var anos: [String] = [
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
    
    private var notasFiltrosEstrela = 0
    
    private var generosFiltro: [String] = []
    private var plataformaFiltro: [String] = []
    private var dataInicial = "1930"
    private var dataFinal = "2022"
    
    let filmes: [Filme]
    
    init() {
        filmes = service.filmes
    }
    
    var getPlataformas: [String] {
        return service.plataformas
    }
    
    var numberOfItems: Int {
        return service.plataformas.count
    }
    
    func getImage(index: Int) -> String {
        return service.plataformas[index]
    }
    
    var numberComponents: Int {
        return 2
    }
    
    var numberOfRows: Int {
        return anos.count
    }
    
    func titleForRow(row: Int) -> String {
        return anos[row]
    }
    
    func getTitleForTextField(row: Int, componente: Int) -> String {
        if componente == 0 {
            dataInicial = anos[row]
        } else {
            dataFinal = anos[row]
        }
        
        return "De \(dataInicial) Até \(dataFinal)"
    }
    
    func roletaFilmeFiltrado() -> Filme {
        var filme: Filme?
        let filmeFiltradoGenero = filtraPorGenero(generos: generosFiltro, filmes: service.filmes)
        
        let filmeFiltradoNota = filtrarPorNota(nota: notasFiltrosEstrela, filmes: filmeFiltradoGenero)
        
        let filmeFiltradoData = filtrarPorData(dataInicial: dataInicial, dataFinal: dataFinal, filmes: filmeFiltradoNota)
        
        filme = filmeFiltradoData.randomElement()
        
        return filme ?? service.filmeNil
    }
    
    private func filtrarPorData(dataInicial: String, dataFinal: String, filmes: [Filme]) -> [Filme] {
        let filmesData = filmes.filter { filmesData in
            filmesData.ano >= dataInicial && filmesData.ano <= dataFinal
        }
        return filmesData
    }
    
    private func filtrarPorNota(nota: Int, filmes: [Filme]) -> [Filme] {
            let filmesNota = filmes.filter { filmesNota in
            filmesNota.nota >= notasFiltrosEstrela
        }
        return filmesNota
    }
    
    private func filtraPorGenero(generos: [String], filmes: [Filme]) -> [Filme] {
        var filme: [Filme] = []
        
        for genero in generos {
            let filmesFiltrados = filmes.filter { filme in
                filme.genero == genero
            }
            filme.append(contentsOf: filmesFiltrados)
        }
        
        return filme
    }
    
    func estrelaNotaPressionada(_ tag: Int) {
        for index in 0...4 {
            if index > tag {
                delegate?.estrelaVazia(tag: index)
                
            } else {
                delegate?.estrelaCheia(tag: index)
            }
        }
        notasFiltrosEstrela = (tag + 1) * 2
    }
    
    func generoPressionado(_ genero: String?, alpha: Float, tag: Int) {
        guard let genero = genero else { return }
        if alpha == 1 {
            generosFiltro.append(genero)
            delegate?.botaoSelecionado(tag: tag)
        } else {
            generosFiltro.removeAll { generoFiltro in
                return genero == generoFiltro
            }
            delegate?.botaoSemSelecao(tag: tag)
        }
    }
    
    func verificaFavorito(filme: Filme) -> Bool {
        return service.filmesFavoritos.contains { filmeFavorito in
            filme.nome == filmeFavorito.nome
        }
    }
    
    func verificaAssistido(filme: Filme) -> Bool {
        return service.filmesAssistidos.contains { filmeFavorito in
            filme.nome == filmeFavorito.nome
        }
    }
}
