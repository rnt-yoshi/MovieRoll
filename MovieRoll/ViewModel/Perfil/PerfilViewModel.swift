//
//  PerfilViewModel.swift
//  MovieRoll
//
//  Created by Renato Yoshinari on 03/06/22.
//

import Foundation

protocol PerfilViewModelDelegate {
    func exibeMeusDados()
    func exibeHistorico()
    func exibeConfiguracoes()
}

class PerfilViewModel {
    
    private var userPerfil = User(name: "Renato", image: "Renato")
    
    var delegate: PerfilViewModelDelegate?
    
    private var optionsDoPerfil = [
        OptionsDoPerfil(
            titulo: "Meus Dados",
            subtitulo: "Meus dados pessoais.",
            imagem: "meusdados"
        ),
        OptionsDoPerfil(
            titulo: "Histórico",
            subtitulo: "Histórico da Roleta, favoritos e assistidos.",
            imagem: "roleta"
        ),
        OptionsDoPerfil(
            titulo: "Configurações",
            subtitulo: "Configurações do app.",
            imagem: "config"
        ),
        OptionsDoPerfil(
            titulo: "Ajuda",
            subtitulo: "Ajuda do app.",
            imagem: "ajuda"
        )
    ]
    
    var numberOfSection: Int {
        return 2
    }
    
    func numberOfRows(section: Int) -> Int {
        if section == 0 {
            return 1
        }
        if section == 1 {
            return optionsDoPerfil.count
        }
        return 0
    }
    
    func getImage(indexPath: IndexPath) -> String {
        if indexPath.section == 0 {
            return userPerfil.image
        } else {
            return optionsDoPerfil[indexPath.row].imagem
        }
    }
    
    func getMaximumSize(indexPath: IndexPath) -> Int {
        if indexPath.section == 0 {
            return 64
        } else {
            return 32
        }
    }
    
    func getCornerRadius(indexPath: IndexPath) -> Int{
        if indexPath.section == 0 {
            return 32
        } else {
            return 5
        }
    }
    
    func getText(indexPath: IndexPath) -> String {
        if indexPath.section == 0 {
            return userPerfil.name
        } else {
            return optionsDoPerfil[indexPath.row].titulo
        }
    }
    
    func getSecondaryText(indexPath: IndexPath) -> String? {
        if indexPath.section == 0 {
            return nil
        } else {
            return optionsDoPerfil[indexPath.row].subtitulo
        }
    }
    
    func getMeusDadosViewModel() -> MeusDadosViewModel? {
        return MeusDadosViewModel(user: userPerfil)
    }
    
    func getHistoricoViewModel() -> HistoricoViewModel? {
        return HistoricoViewModel()
    }
    
    func getConfiguracoesViewMdel() -> ConfiguracoesViewModel? {
        return ConfiguracoesViewModel()
    }
    
    func opcoesDaTableView(index: Int) {
        if index == 0 {
            delegate?.exibeMeusDados()
        }
        if index == 1 {
            delegate?.exibeHistorico()
        }
        if index == 2 {
            delegate?.exibeConfiguracoes()
        }
    }
}
