//
//  DetalhesFilmeViewController.swift
//  MovieRoll
//
//  Created by Vitor Henrique Barreiro Marinho on 04/06/22.
//

import UIKit

class DetalhesFilmeViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet private weak var posterFilme: UIImageView!
    @IBOutlet private weak var nomeDoFilmeLabel: UILabel!
    @IBOutlet private weak var anoLabel: UILabel!
    @IBOutlet private weak var generoLabel: UILabel!
    @IBOutlet private weak var notaDoFilme: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet private weak var plataformaImageView: UIImageView!
    
    //MARK: - Public Properties

    var viewModel: DetalhesFilmeViewModel?
    
    //MARK: - Public Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.delegate = self
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        customNavigationBar()
        navigationItem.setLeftBarButton(backButton(), animated: true)
        navigationItem.setRightBarButtonItems([checkButton(), favoritesButton()], animated: true)
    }
    
    //MARK: - Private Methods
    
    private func configureUI() {
        guard let viewModel = viewModel else { return }
        
        posterFilme.image = UIImage(data: viewModel.getPosterImage)
        nomeDoFilmeLabel.text = viewModel.getNome
        anoLabel.text = viewModel.getAno
        generoLabel.text = viewModel.getGenero
        notaDoFilme.text = ("\(viewModel.getNotaFilme)/10")
        overviewLabel.text = viewModel.getSinopse
        plataformaImageView.image = UIImage(named: viewModel.getPlataforma)
        plataformaImageView.layer.cornerRadius = 10
    }
    
    private func customNavigationBar(){
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.tintColor = .white
    }
    
    private func backButton() -> UIBarButtonItem {
        let backButton = UIBarButtonItem(
            image: UIImage(named: "back"),
            style: .done,
            target: self,
            action: #selector(didTouchBackButton)
        )
        return backButton
    }
    
    private func favoritesButton() -> UIBarButtonItem {
        let favoritesButton = UIBarButtonItem(
            image: UIImage(named: viewModel?.getFavoritarButtonImage ?? "heart"),
            style: .done,
            target: self,
            action: #selector(didTouchFavoritosButton)
        )
        return favoritesButton
    }
    
    private func checkButton() -> UIBarButtonItem {
        let checkButton = UIBarButtonItem(
            image: UIImage(named: viewModel?.getAssistidoButtonImage ?? "check"),
            style: .done,
            target: self,
            action: #selector(didTouchCheckButton)
        )
        return checkButton
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
    
}

//MARK: - DetalhesFilmeViewModel Delegate

extension DetalhesFilmeViewController: DetalhesFilmeViewModelDelegate {
    func alteraFavoritoButton() {
        guard let viewModel = viewModel else { return }
        navigationItem.rightBarButtonItems?[1].image = UIImage(named: viewModel.getFavoritarButtonImage)
    }
    
    func alteraAssistidoButton() {
        guard let viewModel = viewModel else { return }
        navigationItem.rightBarButtonItems?[0].image = UIImage(named: viewModel.getAssistidoButtonImage)
    }
}

//MARK: - NavigationController IGestureRecognizerDelegate

extension DetalhesFilmeViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
