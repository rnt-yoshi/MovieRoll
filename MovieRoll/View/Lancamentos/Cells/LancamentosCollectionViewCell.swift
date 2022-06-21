//
//  LancamentosCollectionViewCell.swift
//  MovieRoll
//
//  Created by Raul Felippe on 04/06/22.
//

import UIKit

class LancamentosCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imagemFilmeUIImageView: UIImageView!
  
    func configure(section: Int, row: Int, viewModel: LancamentosViewModel) {
        imagemFilmeUIImageView.image = UIImage(data: viewModel.getImage(section: section, row: row))
        imagemFilmeUIImageView.layer.cornerRadius = 10
    }
}
