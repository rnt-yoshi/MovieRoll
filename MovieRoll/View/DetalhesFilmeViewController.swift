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
    @IBOutlet weak var sinopseLabel: UILabel!
    
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
        
        let botao = UIBarButtonItem(barButtonSystemItem: .edit , target: self, action: nil)
        let botao2 = UIBarButtonItem(barButtonSystemItem: .edit , target: self, action: nil)

        navigationItem.setRightBarButtonItems([botao,botao2], animated: true)
        
        let backButton = UIBarButtonItem(barButtonSystemItem: .close , target: self, action: #selector(didTouchBackButton))
        navigationItem.setLeftBarButton(backButton, animated: true)
        navigationItem.setHidesBackButton(true, animated: true)

        
    }
    //MARK: - Funcoes Privadas
    @objc private func didTouchBackButton(){
        navigationController?.popViewController(animated: true)
        
    }

//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//
//        // Restore the navigation bar to default
//        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
//        navigationController?.navigationBar.shadowImage = nil
//    }

    private func configureUI () {
        
        guard let viewModel = viewModel else { return }

        posterFilme.image = UIImage(named: viewModel.getPoster)
        nomeDoFilmeLabel.text = viewModel.getNome
        anoLabel.text = viewModel.getAno
        generoLabel.text = viewModel.getGenero
        notaDoFilme.text = viewModel.getNotaFilme
        classificacaoIndicativaImage.image = UIImage(named: viewModel.getClassificacaoIndicativaImage)
        classificacaoIndicativaLabel.text = viewModel.getClassificacaoIndicativa
        sinopseLabel.text = viewModel.getSinopse
        plataformaImageView.image = UIImage(named:         viewModel.getPlataforma)
        
    }
    

}
