//
//  ConfiguracoesViewModel.swift
//  MovieRoll
//
//  Created by Renato Yoshinari on 06/06/22.
//

import Foundation

protocol ConfiguracoesViewModelDelegate {
    func exibeAlertaRoletado()
    func exibeAlertaFavorito()
    func exibeAlertaAssistido()
    func exibeAlertaDesconectar()
}

class ConfiguracoesViewModel {
    //MARK: - Private Properties
    
    private let service: Service = .init()
    private let coreDataService: CoreDataService = .init()
    
    //MARK: - Public Properties
    
    var delegate: ConfiguracoesViewModelDelegate?

    //MARK: - Public Methods
    
    func resetarRoletadosButton() {
        delegate?.exibeAlertaRoletado()
    }
    
    func resetarFavoritosButton() {
        delegate?.exibeAlertaFavorito()
    }
    
    func resetarAssistidosButton() {
        delegate?.exibeAlertaAssistido()
    }
    func desconectarContaButton() {
        delegate?.exibeAlertaDesconectar()
    }
    
    func resetarFilmesRoletados() {
        let roletados = coreDataService.pegarListaDeRoletadosNoCoreData()
        for roletado in roletados {
            coreDataService.removerFilmeRoletadoCoreData(coreDataMovie: roletado)
        }
    }
    
    func resetarFilmesFavoritos() {
        let favoritos = coreDataService.pegarListaDeFavoritosNoCoreData()
        for favorito in favoritos {
            coreDataService.removerFilmeFavoritoCoreData(coreDataMovie: favorito)
        }
    }
    
    func resetarFilmesAssistidos() {
        let assistidos = coreDataService.pegarListaDeAssistidosNoCoreData()
        for assistido in assistidos {
            coreDataService.removerFilmeAssistidoCoreData(coreDataMovie: assistido)
        }
    }
    
    func desconectarConta() {
        
    }
}
