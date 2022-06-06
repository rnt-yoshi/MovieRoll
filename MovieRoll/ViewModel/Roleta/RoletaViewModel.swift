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
        "1970",
        "1980",
        "1990",
        "2000",
        "2010",
        "2020",
        "2021",
        "2022"
    ]
    
    private var notasFiltrosEstrela = 0
    
    private var generosFiltro: [String] = []
    
    var dataInicial = ""
    var dataFinal = ""
    
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
        let filme = filmes.filter { filme in
            filme.nota >= notasFiltrosEstrela
            
        }
        return filme[0]
        
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
    
}
