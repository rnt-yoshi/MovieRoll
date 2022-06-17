//
//  LancamentosTableViewCell.swift
//  MovieRoll
//
//  Created by Raul Felippe on 04/06/22.
//

import UIKit

protocol LancamentosTableViewCellDelegate: AnyObject {
    
    func didSelectItem (row: Int, section: Int )
}

class LancamentosTableViewCell: UITableViewCell {
    //MARK: - IBOULETS & variáveis
    @IBOutlet weak var lancamentosCollectionView: UICollectionView!
    
    var movies: [Movie]?
    weak var delegate: LancamentosTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lancamentosCollectionView.dataSource = self
        lancamentosCollectionView.delegate = self
    }
    //MARK: - Funções Públicas
    func config(delegate: LancamentosTableViewCellDelegate, movies: [Movie] ){
        self.delegate = delegate
        self.movies = movies
    }
}
//MARK: - CollectionView DataSource & Delegate
extension LancamentosTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = lancamentosCollectionView.dequeueReusableCell(withReuseIdentifier: "idCellCollection", for: indexPath) as? LancamentosCollectionViewCell else { return UICollectionViewCell()}
        
        guard let movie = movies?[indexPath.row] else { return UICollectionViewCell()}

        cell.movie = movie
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectItem(row: indexPath.row, section: collectionView.tag)
    }
}


