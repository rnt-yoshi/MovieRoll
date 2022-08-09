//
//  HistoricoViewController.swift
//  MovieRoll
//
//  Created by Renato Yoshinari on 04/06/22.
//

import UIKit

class HistoricoViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet  weak var segmentedControlRoletadosFavoritosAssistidos: UISegmentedControl!
    @IBOutlet private weak var historicoCollectionView: UICollectionView!
    
    //MARK: - Private Properties
    
    private var segmentedControlIndex = 0
    
    private var searchController: UISearchController?
    
    //MARK: - Public Properties
    
    var viewModel: HistoricoViewModel?
    
    //MARK: - Public Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.delegate = self
        viewModel?.loadMovies()
        historicoCollectionView.delegate = self
        historicoCollectionView.dataSource = self
        setupSegmentedControl()
        
        createSearchBar()
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel?.loadMovies()
        historicoCollectionView.reloadData()
    }
    
    
    //MARK: - Private Methods
    
    private func createSearchBar(){
        searchController = UISearchController(searchResultsController: nil)
        searchController?.searchResultsUpdater = self
        searchController?.searchBar.sizeToFit()
        navigationItem.searchController = searchController
        
        changeColorTextoSearchBar()
    }
    
    private func changeColorTextoSearchBar(){
        let textFieldInsideSearchBar = searchController?.searchBar.value(forKey: "searchField") as? UITextField
        
        textFieldInsideSearchBar?.textColor = .white
    }
    
    private func setupSegmentedControl() {
        segmentedControlRoletadosFavoritosAssistidos.setTitleTextAttributes(
            [.foregroundColor: UIColor.white],
            for: .normal
        )
    }
    
    //MARK: - Actions
    
    @IBAction func actionSegmentedControl(_ sender: Any) {
        segmentedControlIndex = segmentedControlRoletadosFavoritosAssistidos.selectedSegmentIndex
        historicoCollectionView.reloadData()
    }
    
}
//MARK: - HistoricoViewModelDelegate

extension HistoricoViewController: HistoricoViewModelDelegate {
    func reloadCollectionView() {
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
        guard let detalhesFilme = storyboard?.instantiateViewController(withIdentifier: "detalhesFilme") as? MoviesDetailsViewController else { return }
        let ehFavorito = viewModel.verificaFavorito(movie: movie)
        let foiAssistido = viewModel.verificaAssistido(movie: movie)
        
        let detalhesFilmeViewModel = MovieDetailsViewModel(movie: movie, isFavorite: ehFavorito, isWatched: foiAssistido)
        detalhesFilme.viewModel = detalhesFilmeViewModel
        navigationController?.pushViewController(detalhesFilme, animated: true)
    }
}
//MARK: - UISearchBar Results Updating

extension HistoricoViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        viewModel?.searchResults(searchController: searchController)
    }
    
}



