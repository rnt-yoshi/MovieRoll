//
//  LancamentosTableViewCell.swift
//  MovieRoll
//
//  Created by Raul Felippe on 04/06/22.
//

import UIKit

class LancamentosTableViewCell: UITableViewCell {
    //MARK: - IBOULETS & variáveis
    @IBOutlet weak var lancamentosCollectionView: UICollectionView!
    
    var section: Int?
    var viewModel: LancamentosViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lancamentosCollectionView.dataSource = self
        lancamentosCollectionView.delegate = self
    }
    //MARK: - Funções Públicas
    func config(viewModel: LancamentosViewModel, section: Int) {
        self.viewModel = viewModel
        self.section = section
    }
}
//MARK: - CollectionView DataSource & Delegate
extension LancamentosTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.numberOfItems(section: section) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = lancamentosCollectionView.dequeueReusableCell(withReuseIdentifier: "idCellCollection", for: indexPath) as? LancamentosCollectionViewCell else { return UICollectionViewCell()}
          
        guard let viewModel = viewModel, let section = section else { return UICollectionViewCell()}
      
        cell.configure(section: section, row: indexPath.row, viewModel: viewModel)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel?.setProvidersMovies(row: indexPath.row, section: collectionView.tag)
    }
}


