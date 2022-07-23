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
    
    lazy var resetarRoletadosButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Filmes Roletados"
        configuration.baseForegroundColor = .white
        configuration.attributedTitle?.font = UIFont(name: "AmsiPro-Bold", size: 17)
        configuration.image = UIImage(systemName: "trash")
        configuration.image?.withTintColor(.white)
        configuration.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 12)
        configuration.imagePadding = 10
        configuration.background.backgroundColor = UIColor(named: "orangeMovieRoll")
        configuration.background.cornerRadius = 5
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 5, bottom: 8, trailing: 0)
        let button = UIButton(configuration: configuration)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        button.addTarget(self, action: #selector(resetarRoletadosButtonAction), for: .touchUpInside)
        return button
    }()
    
    lazy var resetarFavoritosButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Filmes Favoritos"
        configuration.baseForegroundColor = .white
        configuration.attributedTitle?.font = UIFont(name: "AmsiPro-Bold", size: 17)
        configuration.image = UIImage(systemName: "trash")
        configuration.image?.withTintColor(.white)
        configuration.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 12)
        configuration.imagePadding = 10
        configuration.background.backgroundColor = UIColor(named: "orangeMovieRoll")
        configuration.background.cornerRadius = 5
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 5, bottom: 8, trailing: 10)
        let button = UIButton(configuration: configuration)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        button.addTarget(self, action: #selector(resetarFavoritosButtonAction), for: .touchUpInside)
        return button

    }()
    
    lazy var resetarAssistidosButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Filmes Assistidos"
        configuration.baseForegroundColor = .white
        configuration.attributedTitle?.font = UIFont(name: "AmsiPro-Bold", size: 17)
        configuration.image = UIImage(systemName: "trash")
        configuration.image?.withTintColor(.white)
        configuration.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 12)
        configuration.imagePadding = 10
        configuration.background.backgroundColor = UIColor(named: "orangeMovieRoll")
        configuration.background.cornerRadius = 5
        let button = UIButton(configuration: configuration)
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 5, bottom: 8, trailing: 0)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        button.addTarget(self, action: #selector(resetarAssistidosButtonAction), for: .touchUpInside)
        return button
    }()
    
    lazy var desconectarContaButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Desconectar Conta", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "AmsiPro-Bold", size: 14)
        button.backgroundColor = UIColor(named: "orangeMovieRoll")
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(desconectarContaButtonAction), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Public Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        title = "Configurações"
        view.addSubview(resetarRoletadosButton)
        view.addSubview(resetarFavoritosButton)
        view.addSubview(resetarAssistidosButton)
        view.addSubview(desconectarContaButton)
        setupConstraints()
        viewModel?.delegate = self
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            resetarRoletadosButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 64),
            resetarRoletadosButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            resetarRoletadosButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            
            resetarFavoritosButton.topAnchor.constraint(equalTo: resetarRoletadosButton.bottomAnchor, constant: 16),
            resetarFavoritosButton.leadingAnchor.constraint(equalTo: resetarRoletadosButton.leadingAnchor),
            resetarFavoritosButton.trailingAnchor.constraint(equalTo: resetarRoletadosButton.trailingAnchor),
            
            resetarAssistidosButton.topAnchor.constraint(equalTo: resetarFavoritosButton.bottomAnchor, constant: 16),
            resetarAssistidosButton.leadingAnchor.constraint(equalTo: resetarFavoritosButton.leadingAnchor),
            resetarAssistidosButton.trailingAnchor.constraint(equalTo: resetarFavoritosButton.trailingAnchor),
            
            desconectarContaButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            desconectarContaButton.widthAnchor.constraint(equalToConstant: 170),
            desconectarContaButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
        ])
    }
    
    //MARK: - Actions
    
    @objc func resetarRoletadosButtonAction() {
        viewModel?.resetarRoletadosButton()
    }
    
    @objc func resetarFavoritosButtonAction() {
        viewModel?.resetarFavoritosButton()
    }
    
    @objc func resetarAssistidosButtonAction() {
        viewModel?.resetarAssistidosButton()
    }
    
    @objc func desconectarContaButtonAction() {
        viewModel?.resetarFilmesRoletados()
        viewModel?.resetarFilmesFavoritos()
        viewModel?.resetarFilmesAssistidos()
        viewModel?.desconectarContaButton()
    }
}

//MARK: - ConfiguracoesViewModel Delegate

extension ConfiguracoesViewController: ConfiguracoesViewModelDelegate {
    func navigationBack() {
        navigationController?.popViewController(animated: true)
    }
    
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

import SwiftUI

struct ConfiguracaoViewControllerPreviews: PreviewProvider {
    static var previews: some View {
        ForEach(deviceNames, id: \.self) { deviceName in
            ViewControllerPreview {
                ConfiguracoesViewController()
            }.previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
