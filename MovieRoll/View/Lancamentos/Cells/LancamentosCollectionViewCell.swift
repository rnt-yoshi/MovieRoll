//
//  LancamentosCollectionViewCell.swift
//  MovieRoll
//
//  Created by Raul Felippe on 04/06/22.
//

import UIKit

class LancamentosCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imagemFilmeUIImageView: UIImageView!

    var movie: Movie? {
        didSet {
            if let movie = movie {
                configure(movie: movie)
            }
        }
    }
   
    func configure(movie: Movie) {
        imagemFilmeUIImageView.image = UIImage(named: movie.posterPath)
        imagemFilmeUIImageView.layer.cornerRadius = 10
    }
}
