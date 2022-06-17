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
    //MARK: - Variáveis
    var delegate: ConfiguracoesViewModelDelegate?
    private let service = Service.shared
    //MARK: - Funções Públicas
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
        service.filmesRoletados.removeAll()
    }
    
    func resetarFilmesFavoritos() {
        service.filmesFavoritos.removeAll()
    }
    
    func resetarFilmesAssistidos() {
        service.filmesAssistidos.removeAll()
    }
    
    func desconectarConta() {
        
    }
}
