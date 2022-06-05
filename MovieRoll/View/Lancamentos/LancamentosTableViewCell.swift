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
    
    var filmes: [Filme]?
    weak var delegate: LancamentosDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lancamentosCollectionView.dataSource = self
        lancamentosCollectionView.delegate = self
    }
    
    func config(delegate: LancamentosDelegate, filmes: [Filme] ){
        self.delegate = delegate
        self.filmes = filmes
    }
    
}
//MARK: - CollectionView DataSoure
extension LancamentosTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filmes?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = lancamentosCollectionView.dequeueReusableCell(withReuseIdentifier: "idCellCollection", for: indexPath) as? LancamentosCollectionViewCell else { return UICollectionViewCell()}
        
        guard let filme = filmes?[indexPath.row] else { return UICollectionViewCell()}
        cell.configure(filme: filme) 
        
        return cell
    }
    
}
//MARK: - CollectionView Delegate
extension LancamentosTableViewCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        delegate?.didSelectItem(index: indexPath.item)
        
    }
    
    
    
    
}
