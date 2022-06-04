//
//  LancamentosTableViewCell.swift
//  MovieRoll
//
//  Created by Raul Felippe on 04/06/22.
//

import UIKit

protocol LancamentosDelegate: AnyObject {
    
    func didSelectItem (index:Int)
}

class LancamentosTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lancamentosCollectionView: UICollectionView!
    
    var viewModel = LancamentosTableViewModel()
    
    weak var delegate:LancamentosDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lancamentosCollectionView.dataSource = self
        lancamentosCollectionView.delegate = self
    }
    
  
}

extension LancamentosTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems(section: section)
        //        return Service().filmes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = lancamentosCollectionView.dequeueReusableCell(withReuseIdentifier: "idCellCollection", for: indexPath) as? LancamentosCollectionViewCell
        
        let cellViewModel = viewModel.getCellViewModel(index: indexPath.row)
        
        cell?.configure(viewModel: cellViewModel)
        
        return cell ?? UICollectionViewCell()
    }
    
}


extension LancamentosTableViewCell:UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        delegate?.didSelectItem(index: indexPath.item)
        
    }
    
    
    
    
}
