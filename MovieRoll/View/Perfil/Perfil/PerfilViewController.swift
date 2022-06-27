//
//  ViewController.swift
//  MovieRoll
//
//  Created by Vitor Henrique Barreiro Marinho on 25/05/22.
//

import UIKit

class PerfilViewController: UIViewController {
    
    //MARK: - Private Properties
    
    @IBOutlet private weak var perfilTableView: UITableView!
    
    private let viewModel = PerfilViewModel()
    
    //MARK: - Public Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        perfilTableView.delegate = self
        perfilTableView.dataSource = self
        
        viewModel.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        perfilTableView.reloadData()
    }
}
//MARK: - PerfilViewModel Delegate

extension PerfilViewController: PerfilViewModelDelegate {
    func exibeMeusDados() {
        if let meusDadosVC = storyboard?.instantiateViewController(withIdentifier: "meusDadosVC") as? MeusDadosViewController {
            meusDadosVC.viewModel = viewModel.getMeusDadosViewModel()
            meusDadosVC.navigationItem.largeTitleDisplayMode = .never
            navigationController?.pushViewController(meusDadosVC, animated: true)
        }
    }
    
    func exibeHistorico() {
        if let historicoVC = storyboard?.instantiateViewController(withIdentifier: "historicoVC") as? HistoricoViewController {
            historicoVC.viewModel = viewModel.getHistoricoViewModel()
            historicoVC.navigationItem.largeTitleDisplayMode = .never
            navigationController?.pushViewController(historicoVC, animated: true)
        }
    }
    
    func exibeConfiguracoes() {
        if let configuracoesVC = storyboard?.instantiateViewController(withIdentifier: "configuracoesVC") as? ConfiguracoesViewController {
            configuracoesVC.viewModel = viewModel.getConfiguracoesViewMdel()
            configuracoesVC.navigationItem.largeTitleDisplayMode = .never
            navigationController?.pushViewController(configuracoesVC, animated: true)
        }
    }
    
    func exibeAjuda() {
        if let ajudaVC = storyboard?.instantiateViewController(withIdentifier: "ajudaVC") as? AjudaViewController {
            ajudaVC.modalPresentationStyle = .pageSheet
            ajudaVC.modalTransitionStyle = .coverVertical
            present(ajudaVC, animated: true)
        }
    }
    
}

//MARK: - TableView DataSource & Delegate

extension PerfilViewController: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSection
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = UIColor(red: 46.0/255, green: 46.0/255, blue: 46.0/255, alpha: 0.4)
        cell.selectionStyle = .none
        
        var content = cell.defaultContentConfiguration()
        
        content.image = UIImage(named: viewModel.getImage(indexPath: indexPath))

        content.imageProperties.maximumSize = CGSize(
            width: viewModel.getMaximumSize(indexPath: indexPath),
            height: viewModel.getMaximumSize(indexPath: indexPath)
        )
        content.imageProperties.cornerRadius = CGFloat(viewModel.getCornerRadius(indexPath: indexPath))
        
        content.text = viewModel.getText(indexPath: indexPath)
        content.secondaryText = viewModel.getSecondaryText(indexPath: indexPath)
        content.textProperties.color = .white
        content.secondaryTextProperties.color = .white
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.opcoesDaTableView(index: indexPath.row)
    }
}

