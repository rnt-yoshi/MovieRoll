//
//  DetalhesFilmeViewController.swift
//  MovieRoll
//
//  Created by Vitor Henrique Barreiro Marinho on 04/06/22.
//

import UIKit

class DetalhesFilmeViewController: UIViewController {
    
    var viewModel:DetalhesFilmeViewModel?
    
    @IBOutlet weak var posterFilme: UIImageView!
    
    @IBOutlet weak var nomeDoFilmeLabel: UILabel!
    @IBOutlet weak var anoLabel: UILabel!
    @IBOutlet weak var generoLabel: UILabel!
    @IBOutlet weak var notaDoFilme: UILabel!
    @IBOutlet weak var classificacaoIndicativaLabel: UILabel!
    @IBOutlet weak var sinopseTextView: UITextView!
    
    @IBOutlet weak var classificacaoIndicativaImage: UIImageView!
    
    @IBOutlet weak var plataformaImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Make the navigation bar background clear
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.tintColor = .white
        
        let backButton = UIBarButtonItem(image: UIImage(named: "back"), style: .done, target: self, action: #selector(didTouchBackButton))
        navigationItem.setLeftBarButton(backButton, animated: true)
        navigationItem.setHidesBackButton(true, animated: true)
        
        let favoritosButton = UIBarButtonItem(image: UIImage(named: "heartnil"), style: .done, target: self, action: nil)
        let checkButton = UIBarButtonItem(image: UIImage(named: "check"), style: .done, target: self, action: nil)
        navigationItem.setRightBarButtonItems([checkButton, favoritosButton], animated: true)
    }
    
    //MARK: - Funcoes Privadas
    @objc private func didTouchBackButton(){
        navigationController?.popViewController(animated: true)
    }

    private func configureUI () {
        
        guard let viewModel = viewModel else { return }

        posterFilme.image = UIImage(named: viewModel.getPoster)
        nomeDoFilmeLabel.text = viewModel.getNome
        anoLabel.text = viewModel.getAno
        generoLabel.text = viewModel.getGenero
        notaDoFilme.text = ("\(viewModel.getNotaFilme)/10")
        classificacaoIndicativaImage.image = UIImage(named: viewModel.getClassificacaoIndicativaImage)
        classificacaoIndicativaLabel.text = viewModel.getClassificacaoIndicativa
        sinopseTextView.text = viewModel.getSinopse
        plataformaImageView.image = UIImage(named: viewModel.getPlataforma)
        
        classificacaoIndicativaImage.layer.cornerRadius = 10
        plataformaImageView.layer.cornerRadius = 10
    }
}
