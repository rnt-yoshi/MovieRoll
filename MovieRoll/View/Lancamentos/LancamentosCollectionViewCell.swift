//
//  LancamentosCollectionViewCell.swift
//  MovieRoll
//
//  Created by Raul Felippe on 04/06/22.
//

import UIKit

class LancamentosCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imagemFilmeUIImageView: UIImageView!
    
    var filme: Filme? {
        didSet {
            if let filme = filme {
                configure(filme: filme)
            }
        }

    }
   
    
    func configure(filme: Filme) {
        imagemFilmeUIImageView.image = UIImage(named: filme.image)
    }
        
}

