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
    var viewModel: LancamentosViewModel?
    weak var delegate: LancamentosTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lancamentosCollectionView.dataSource = self
        lancamentosCollectionView.delegate = self
    }
    //MARK: - Funções Públicas
    func config(delegate: LancamentosTableViewCellDelegate, viewModel: LancamentosViewModel, movies: [Movie] ){
        self.delegate = delegate
        self.viewModel = viewModel
        self.movies = movies
    }
}
//MARK: - CollectionView DataSource & Delegate
extension LancamentosTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.numberOfItems(section: section) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = lancamentosCollectionView.dequeueReusableCell(withReuseIdentifier: "idCellCollection", for: indexPath) as? LancamentosCollectionViewCell else { return UICollectionViewCell()}
        
        guard let movie = movies?[indexPath.row] else { return UICollectionViewCell()}
        
        cell.configure(movie: movie, viewModel: LancamentosViewModel())
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectItem(row: indexPath.row, section: collectionView.tag)
    }
}


