//
//  PlataformasCollectionViewCell.swift
//  MovieRoll
//
//  Created by Artur Franca on 04/06/22.
//

import UIKit

class PlataformasCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var plataformaImageView: UIImageView!
    
    func configuraCell(viewModel: RoletaViewModel, index: Int) {
        
        plataformaImageView.image = UIImage(named: viewModel.getImage(index: index))
        
        plataformaImageView.layer.cornerRadius = 10
    
    }
}


