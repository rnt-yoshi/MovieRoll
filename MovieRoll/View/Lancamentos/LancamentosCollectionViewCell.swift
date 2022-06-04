//
//  LancamentosCollectionViewCell.swift
//  MovieRoll
//
//  Created by Raul Felippe on 04/06/22.
//

import UIKit

class LancamentosCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imagemFilmeUIImageView: UIImageView!
    
    func configure(viewModel: UmLancamentoCollectionViewModel) {
        imagemFilmeUIImageView.image = viewModel.getImage()
    }
        
}

