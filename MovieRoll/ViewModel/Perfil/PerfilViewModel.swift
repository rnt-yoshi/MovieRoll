//
//  PerfilViewModel.swift
//  MovieRoll
//
//  Created by Renato Yoshinari on 03/06/22.
//

import Foundation
import UIKit
import FirebaseAuth

protocol PerfilViewModelDelegate {
    func exibeMeusDados()
    func exibeHistorico()
    func exibeConfiguracoes()
    func exibeAjuda()
    func exibeLogin()
}

class PerfilViewModel {
    
    //MARK: - Private  Properties
    
    
   // private var userPerfil = User(name: "Steve Jobs", image: "profile01")
    
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
    
    //MARK: - Public Properties
    
    let serviceAuth: ServiceAuth = .init()
    var delegate: PerfilViewModelDelegate?
    
    var numberOfSection: Int {
        return 2
    }
    
    var getMeusDadosViewModel: MeusDadosViewModel? {
        return MeusDadosViewModel()
    }
    
    var getHistoricoViewModel: HistoricoViewModel? {
        return HistoricoViewModel()
    }
    
    var getConfiguracoesViewMdel: ConfiguracoesViewModel? {
        return ConfiguracoesViewModel()
    }
    
    //MARK: - Public Methods

    func numberOfRows(section: Int) -> Int {
        if section == 0 {
            return 1
        }
        if section == 1 {
            return optionsDoPerfil.count
        }
        return 0
    }
    
    func getImage(indexPath: IndexPath) -> Data {
        if indexPath.section == 0 {
            return ServiceAuth.userProfile.image
        }
        return Data()
    }
    
    func getImage(indexPath: IndexPath) -> String {
        if indexPath.section == 1 {
            return optionsDoPerfil[indexPath.row].imagem
        }
        return String()
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
            if ServiceAuth.userProfile.name != "" {
                return ServiceAuth.userProfile.name
            }
            if ServiceAuth.userProfile.email != "" {
                return ServiceAuth.userProfile.email
            }
            return "Desconectado"
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
    
    func pegarInformacoesDoUsuario() {
        serviceAuth.userInfo()
    }
    
    func opcoesDaTableView(index: Int) {
        if Auth.auth().currentUser != nil {
            if index == 0 {
                delegate?.exibeMeusDados()
            }
            if index == 1 {
                delegate?.exibeHistorico()
            }
            if index == 2 {
                delegate?.exibeConfiguracoes()
            }
            if index == 3 {
                delegate?.exibeAjuda()
            }
        } else {
            delegate?.exibeLogin()
        }
    }
}
