//
//  HistoricoCollectionViewCell.swift
//  MovieRoll
//
//  Created by Renato Yoshinari on 06/06/22.
//

import UIKit

class HistoricoCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Private Properties

    @IBOutlet private weak var historicoImage: UIImageView!
    
    //MARK: - Public Methods

    func setupCell(viewModel: HistoricoCellViewModel) {
        historicoImage.image = UIImage(data: viewModel.getImage())
        historicoImage.layer.cornerRadius = 10
    }
}
