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

    
    @IBOutlet weak var anoLabel: UILabel!
    
    
    @IBOutlet weak var generoLabel: UILabel!
    
    
    @IBOutlet weak var notaDoFilme: UILabel!
    
    @IBOutlet weak var classificacaoIndicativaImage: UIImageView!
    
    
    @IBOutlet weak var classificacaoIndicativaLabel: UILabel!
    
    
    @IBOutlet weak var nomeDoFilmeLabel: UILabel!
    
    
    @IBOutlet weak var sinopseLabel: UILabel!
    
    
    
    @IBOutlet weak var plataformaImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()

    }
    

    
    func configureUI () {
        
        guard let viewModel = viewModel else {
            return
        }

        posterFilme.image = UIImage(named: viewModel.getPoster )
        anoLabel.text = viewModel.getAno
        generoLabel.text = viewModel.getGenero
        notaDoFilme.text = viewModel.getNotaFilme
        classificacaoIndicativaImage.image = UIImage(named: viewModel.getClassificacaoIndicativaImage)
        classificacaoIndicativaLabel.text = viewModel.getClassificacaoIndicativa
        sinopseLabel.text = viewModel.getSinopse
        plataformaImageView.image = UIImage(named:         viewModel.getPlataforma)
        
    }
    

}
