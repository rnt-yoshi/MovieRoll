//
//  DetalhesFilmeViewController.swift
//  MovieRoll
//
//  Created by Vitor Henrique Barreiro Marinho on 04/06/22.
//

import UIKit

class DetalhesFilmeViewController: UIViewController {
    
    //MARK: - IBOULETS & variáveis
    @IBOutlet weak var posterFilme: UIImageView!
    @IBOutlet weak var nomeDoFilmeLabel: UILabel!
    @IBOutlet weak var anoLabel: UILabel!
    @IBOutlet weak var generoLabel: UILabel!
    @IBOutlet weak var notaDoFilme: UILabel!
    @IBOutlet weak var sinopseTextView: UITextView!
    @IBOutlet weak var plataformaImageView: UIImageView!
    
    var viewModel: DetalhesFilmeViewModel?
    //MARK: - Funcoes Override
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.delegate = self
        
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        customNavigationBar()
        
        let backButton = UIBarButtonItem(
            image: UIImage(named: "back"),
            style: .done,
            target: self,
            action: #selector(didTouchBackButton)
        )
        navigationItem.setLeftBarButton(backButton, animated: true)
        
        let favoritosButton = UIBarButtonItem(
            image: UIImage(named: viewModel?.getFavoritarButtonImage() ?? "heart"),
            style: .done,
            target: self,
            action: #selector(didTouchFavoritosButton)
        )
        let checkButton = UIBarButtonItem(
            image: UIImage(named: viewModel?.getAssistidoButtonImage() ?? "check"),
            style: .done,
            target: self,
            action: #selector(didTouchCheckButton)
        )
        navigationItem.setRightBarButtonItems([checkButton, favoritosButton], animated: true)
    }
    
    //MARK: - Funcoes Privadas
    private func customNavigationBar(){
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.tintColor = .white
    }
    @objc private func didTouchBackButton(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func didTouchFavoritosButton() {
        viewModel?.buttonFavoritoPressed()
    }
    
    @objc private func didTouchCheckButton() {
        viewModel?.buttonAssistidoPressed()
    }
    
    private func configureUI() {
        guard let viewModel = viewModel else { return }

        posterFilme.image = UIImage(data: viewModel.getPoster())
        nomeDoFilmeLabel.text = viewModel.getNome
        anoLabel.text = viewModel.getAno
        generoLabel.text = viewModel.getGenero()
        notaDoFilme.text = ("\(viewModel.getNotaFilme)/10")
        sinopseTextView.text = viewModel.getSinopse
        plataformaImageView.image = UIImage(named: viewModel.getPlataforma())
        
        plataformaImageView.layer.cornerRadius = 10
    }
}
//MARK: - DetalhesFilmeViewModel Delegate
extension DetalhesFilmeViewController: DetalhesFilmeViewModelDelegate {
    func alteraFavoritoButton() {
        guard let viewModel = viewModel else { return }
        navigationItem.rightBarButtonItems?[1].image = UIImage(named: viewModel.getFavoritarButtonImage())
    }
    
    func alteraAssistidoButton() {
        guard let viewModel = viewModel else { return }
        navigationItem.rightBarButtonItems?[0].image = UIImage(named: viewModel.getAssistidoButtonImage())
    }
}
