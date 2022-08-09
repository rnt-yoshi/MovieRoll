//
//  LancamentosCollectionViewCell.swift
//  MovieRoll
//
//  Created by Raul Felippe on 04/06/22.
//

import UIKit

class LancamentosCollectionViewCell: UICollectionViewCell {
    //MARK: - Private Properties

    @IBOutlet private weak var imagemFilmeUIImageView: UIImageView!
  
    //MARK: - Public Methods

    func configure(section: Int, row: Int, viewModel: LancamentosViewModel) {
//        imagemFilmeUIImageView.image = UIImage(data: viewModel.getImage(section: section, row: row))
        imagemFilmeUIImageView.load(url: viewModel.getImage(section: section, row: row), placeholder: UIImage())
        imagemFilmeUIImageView.layer.cornerRadius = 10
    }
}
