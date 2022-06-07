//
//  InicioViewController.swift
//  MovieRoll
//
//  Created by Renato Yoshinari on 26/05/22.
//

import UIKit

class LancamentosViewController: UIViewController {
    
    
    @IBOutlet weak var lancamentosTableView: UITableView!
    
    var viewModel = LancamentosViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lancamentosTableView.dataSource = self
        lancamentosTableView.delegate = self
        viewModel.pegarFilmesEGeneros()
    }
}

extension LancamentosViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSection
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.retornaTitulo(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = lancamentosTableView.dequeueReusableCell(withIdentifier: "idCellTable", for: indexPath) as? LancamentosTableViewCell else { return UITableViewCell() }
        
        let filmes = viewModel.filmes
        cell.config(delegate: self, filmes: filmes)
        
        return cell
    }
}

extension LancamentosViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let tableHeader = view as! UITableViewHeaderFooterView
        tableHeader.tintColor = UIColor.black
        tableHeader.textLabel?.textColor = .white
    }
}


extension LancamentosViewController: LancamentosDelegate {
    func didSelectItem(index: Int) {
        let filme = viewModel.retornaFilmes(index: index)
        guard let detalhesFilme = storyboard?.instantiateViewController(withIdentifier: "detalhesFilme") as? DetalhesFilmeViewController else { return }
        let viewModel = DetalhesFilmeViewModel(filme: filme)
        detalhesFilme.viewModel = viewModel
        navigationController?.pushViewController(detalhesFilme, animated: true)
    }
}
