//
//  LancamentosTableViewCell.swift
//  MovieRoll
//
//  Created by Raul Felippe on 04/06/22.
//

import UIKit

class LancamentosTableViewCell: UITableViewCell {
    
    //MARK: - Public Properties

    @IBOutlet  weak var lancamentosCollectionView: UICollectionView!
    
    //MARK: - private Properties

    private var section: Int?
    private var viewModel: LancamentosViewModel?
    
    //MARK: - Public Methods

    override func awakeFromNib() {
        super.awakeFromNib()
        lancamentosCollectionView.dataSource = self
        lancamentosCollectionView.delegate = self
    }
    func config(viewModel: LancamentosViewModel, section: Int) {
        self.viewModel = viewModel
        self.section = section
    }
}

//MARK: - CollectionView DataSource & Delegate

extension LancamentosTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.numberOfItems(section: self.section ?? 0) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = lancamentosCollectionView.dequeueReusableCell(withReuseIdentifier: "idCellCollection", for: indexPath) as? LancamentosCollectionViewCell else { return UICollectionViewCell()}
          
        guard let viewModel = viewModel, let section = section else { return UICollectionViewCell()}
      
        cell.configure(section: section, row: indexPath.row, viewModel: viewModel)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel?.setProvidersDataImage(row: indexPath.row, section: collectionView.tag)
    }
}


