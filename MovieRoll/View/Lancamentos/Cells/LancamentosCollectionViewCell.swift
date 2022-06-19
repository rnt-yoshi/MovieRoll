//
//  LancamentosCollectionViewCell.swift
//  MovieRoll
//
//  Created by Raul Felippe on 04/06/22.
//

import UIKit

class LancamentosCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imagemFilmeUIImageView: UIImageView!
   
    func configure(movie: Movie, viewModel: LancamentosViewModel) {
        imagemFilmeUIImageView.image = UIImage(data: viewModel.getImage(movie: movie))
        imagemFilmeUIImageView.layer.cornerRadius = 10
    }
}
