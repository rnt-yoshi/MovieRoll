//
//  ConfiguracoesViewModel.swift
//  MovieRoll
//
//  Created by Renato Yoshinari on 06/06/22.
//

import Foundation
import FirebaseAuth

protocol SettingsViewModelDelegate {
    func showRouletteAlert()
    func showFavoriteAlert()
    func showWatchedAlert()
    func showDiscconectAlert()
    func navigationBack()
}

class SettingsViewModel {
    //MARK: - Private Properties
    
    private let service: Service = .init()
    private let coreDataService: CoreDataService = .init()
    
    //MARK: - Public Properties
    
    var delegate: SettingsViewModelDelegate?

    //MARK: - Public Methods
    
    func resetarRoletadosButton() {
        delegate?.showRouletteAlert()
    }
    
    func resetarFavoritosButton() {
        delegate?.showFavoriteAlert()
    }
    
    func resetarAssistidosButton() {
        delegate?.showWatchedAlert()
    }
    
    func discconectAccountButton() {
        
        delegate?.showDiscconectAlert()
    }
    
    func resetRouletteMovies() {
        let roletados = coreDataService.pegarListaDeRoletadosNoCoreData()
        for roletado in roletados {
            coreDataService.removerFilmeRoletadoCoreData(coreDataMovie: roletado)
        }
    }
    
    func resetFavoriteMovies() {
        let favoritos = coreDataService.pegarListaDeFavoritosNoCoreData()
        for favorito in favoritos {
            coreDataService.removerFilmeFavoritoCoreData(coreDataMovie: favorito)
        }
    }
    
    func resetWatchedMovies() {
        let assistidos = coreDataService.pegarListaDeAssistidosNoCoreData()
        for assistido in assistidos {
            coreDataService.removerFilmeAssistidoCoreData(coreDataMovie: assistido)
        }
    }
    
    func discconectAccount() {
        
        let firebaseAuth = Auth.auth()
     do {
       try firebaseAuth.signOut()
     } catch let signOutError as NSError {
       print("Error signing out: %@", signOutError)
     }
        delegate?.navigationBack()
    }
}
