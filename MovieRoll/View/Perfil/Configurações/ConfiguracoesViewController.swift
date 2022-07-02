//
//  ConfiguracoesViewController.swift
//  MovieRoll
//
//  Created by Renato Yoshinari on 04/06/22.
//

import UIKit

class ConfiguracoesViewController: UIViewController {
    
    //MARK: - Public Properties
     var viewModel: ConfiguracoesViewModel?
    
    //MARK: - Public Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.delegate = self
    }
    //MARK: - Actions
    
    @IBAction func resetarRoletadosButtonPressed(_ sender: Any) {
        viewModel?.resetarRoletadosButton()
    }
    
    @IBAction func resetarFavoritosButtonPressed(_ sender: Any) {
        viewModel?.resetarFavoritosButton()
    }
    
    @IBAction func resetarAssistidosButtonPressed(_ sender: Any) {
        viewModel?.resetarAssistidosButton()
    }
    
    @IBAction func desconectarContaButtonPressed(_ sender: Any) {
        viewModel?.desconectarContaButton()
    }
}

//MARK: - ConfiguracoesViewModel Delegate

extension ConfiguracoesViewController: ConfiguracoesViewModelDelegate {
    func exibeAlertaRoletado() {
        
        let alerta = UIAlertController(title: "Você está removendo toda lista de filmes roletados.", message: "Tem certeza que deseja remover toda a lista de filmes roletados?", preferredStyle: .alert)
        
        let simAction = UIAlertAction(title: "Sim", style: .destructive, handler: {
            alerta in
            self.viewModel?.resetarFilmesRoletados()
        })
        let naoAction = UIAlertAction(title: "Nao", style: .default, handler: nil)
        
        alerta.addAction(naoAction)
        alerta.addAction(simAction)
    
        present(alerta, animated: true)
    }
    
    func exibeAlertaFavorito() {
        let alerta = UIAlertController(title: "Você está removendo toda lista de filmes favoritos.", message: "Tem certeza que deseja remover toda a lista de filmes favoritos?", preferredStyle: .alert)
        
        let simAction = UIAlertAction(title: "Sim", style: .destructive, handler: {
            alerta in
            self.viewModel?.resetarFilmesFavoritos()
        })
        let naoAction = UIAlertAction(title: "Nao", style: .default, handler: nil)
        
        alerta.addAction(naoAction)
        alerta.addAction(simAction)
        
        present(alerta, animated: true)
    }
    
    func exibeAlertaAssistido() {
        let alerta = UIAlertController(title: "Você está removendo toda lista de filmes assistidos.", message: "Tem certeza que deseja remover toda a lista de filmes assistidos?", preferredStyle: .alert)
        
        let simAction = UIAlertAction(title: "Sim", style: .destructive, handler: {
            alerta in
                self.viewModel?.resetarFilmesAssistidos()
        })
        let naoAction = UIAlertAction(title: "Nao", style: .default, handler: nil)
        
        alerta.addAction(naoAction)
        alerta.addAction(simAction)
        
        present(alerta, animated: true)
    }
    
    func exibeAlertaDesconectar() {
        let alerta = UIAlertController(title: "Você está desconectando sua conta deste app.", message: "Tem certeza que deseja desconectar sua conta deste app?", preferredStyle: .alert)
        
        let simAction = UIAlertAction(title: "Sim", style: .destructive, handler: {
            alerta in
            self.viewModel?.desconectarConta()
        })
        let naoAction = UIAlertAction(title: "Nao", style: .default, handler: nil)
        
        alerta.addAction(naoAction)
        alerta.addAction(simAction)
        
        present(alerta, animated: true)
    }
}
