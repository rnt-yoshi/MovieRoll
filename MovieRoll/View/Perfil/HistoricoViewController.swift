//
//  HistoricoViewController.swift
//  MovieRoll
//
//  Created by Renato Yoshinari on 04/06/22.
//

import UIKit

class HistoricoViewController: UIViewController {
    
    //MARK: - IBOULETS & variáveis
    @IBOutlet weak var segmentedControlRoletadosFavoritosAssistidos: UISegmentedControl!
    @IBOutlet weak var historicoCollectionView: UICollectionView!
    
    var viewModel: HistoricoViewModel?
    var segmentedControlIndex = 0
    //MARK: - Funções Override
    override func viewDidLoad() {
        super.viewDidLoad()
        historicoCollectionView.delegate = self
        historicoCollectionView.dataSource = self
        setupSegmentedControl()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        historicoCollectionView.reloadData()
    }
    
    //MARK: - Funções Privadas
    private func setupSegmentedControl() {
        segmentedControlRoletadosFavoritosAssistidos.setTitleTextAttributes(
            [.foregroundColor: UIColor.white],
            for: .normal
        )
    }
    //MARK: - IBACTIONS
    @IBAction func actionSegmentedControl(_ sender: Any) {
        segmentedControlIndex = segmentedControlRoletadosFavoritosAssistidos.selectedSegmentIndex
        historicoCollectionView.reloadData()
    }
}
//MARK: - UICollectionView dataSource & Delegate
extension HistoricoViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.numberOfItems(segmentedControlIndex: segmentedControlIndex) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = historicoCollectionView.dequeueReusableCell(withReuseIdentifier: "historicoCell", for: indexPath) as? HistoricoCollectionViewCell else { return UICollectionViewCell() }
        
        guard let cellViewModel = viewModel?.getCellViewModel(indexPath: indexPath, segmentedControlIndex: segmentedControlIndex) else {return UICollectionViewCell()}
        cell.setupCell(viewModel: cellViewModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let viewModel = viewModel else { return }
        let movie = viewModel.retornaFilme(indexFilme: indexPath.item, indexSegmenterController: segmentedControlIndex)
        guard let detalhesFilme = storyboard?.instantiateViewController(withIdentifier: "detalhesFilme") as? DetalhesFilmeViewController else { return }
        let ehFavorito = viewModel.verificaFavorito(movie: movie)
        let foiAssistido = viewModel.verificaAssistido(movie: movie)
        
        let detalhesFilmeViewModel = DetalhesFilmeViewModel(movie: movie, ehFavorito: ehFavorito, foiAssistido: foiAssistido)
        detalhesFilme.viewModel = detalhesFilmeViewModel
        navigationController?.pushViewController(detalhesFilme, animated: true)
    }
}
