//
//  ViewController.swift
//  MovieRoll
//
//  Created by Vitor Henrique Barreiro Marinho on 25/05/22.
//

import UIKit

class PerfilViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet private weak var perfilTableView: UITableView!
    
    //MARK: - Private Properties
    
    private let viewModel = PerfilViewModel()
    
    //MARK: - Public Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        perfilTableView.delegate = self
        perfilTableView.dataSource = self
        
        viewModel.delegate = self
        viewModel.pegarInformacoesDoUsuario()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        viewModel.pegarInformacoesDoUsuario()
        perfilTableView.reloadData()
    }
    
}
//MARK: - PerfilViewModel Delegate

extension PerfilViewController: PerfilViewModelDelegate {
    func exibeLogin() {
        let loginVC = LoginViewController()
        present(loginVC, animated: true)
    }
    
    func exibeMeusDados() {
        let meusDadosVC = MeusDadosViewController()
        meusDadosVC.viewModel = viewModel.getMeusDadosViewModel
        navigationController?.pushViewController(meusDadosVC, animated: true)
    }
    
    func exibeHistorico() {
        if let historicoVC = storyboard?.instantiateViewController(withIdentifier: "historicoVC") as? HistoricoViewController {
            historicoVC.viewModel = viewModel.getHistoricoViewModel
            historicoVC.navigationItem.largeTitleDisplayMode = .never
            navigationController?.pushViewController(historicoVC, animated: true)
        }
    }
    
    func exibeConfiguracoes() {
        if let configuracoesVC = storyboard?.instantiateViewController(withIdentifier: "configuracoesVC") as? ConfiguracoesViewController {
            configuracoesVC.viewModel = viewModel.getConfiguracoesViewMdel
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
        
        content.image = UIImage(data: viewModel.getImage(indexPath: indexPath)) ?? UIImage(named: viewModel.getImage(indexPath: indexPath))
        
        content.imageProperties.maximumSize = CGSize(
            width: viewModel.getMaximumSize(indexPath: indexPath),
            height: viewModel.getMaximumSize(indexPath: indexPath)
        )
        content.imageProperties.cornerRadius = CGFloat(viewModel.getCornerRadius(indexPath: indexPath))
        content.text = viewModel.getText(indexPath: indexPath)
        content.secondaryText = viewModel.getSecondaryText(indexPath: indexPath)
        content.textProperties.color = .white
        content.secondaryTextProperties.color = .white
        
        content.textProperties.font = UIFont(name: "AmsiPro-Regular", size: 17) ?? UIFont()
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.opcoesDaTableView(index: indexPath.row)
    }
}


