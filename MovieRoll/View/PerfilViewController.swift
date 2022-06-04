//
//  ViewController.swift
//  MovieRoll
//
//  Created by Vitor Henrique Barreiro Marinho on 25/05/22.
//

import UIKit

class PerfilViewController: UIViewController {

    @IBOutlet weak var perfilTableView: UITableView!
    
    let viewModel = PerfilViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        perfilTableView.delegate = self
        perfilTableView.dataSource = self
    }
}

extension PerfilViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if let meusDadosVC = storyboard?.instantiateViewController(withIdentifier: "meusDadosVC") as? MeusDadosViewController {
                meusDadosVC.navigationItem.largeTitleDisplayMode = .never
                navigationController?.pushViewController(meusDadosVC, animated: true)
            }
        }
        if indexPath.row == 1 {
            if let historicoVC = storyboard?.instantiateViewController(withIdentifier: "historicoVC") as? HistoricoViewController {
                historicoVC.navigationItem.largeTitleDisplayMode = .never
                navigationController?.pushViewController(historicoVC, animated: true)
            }
        }
        if indexPath.row == 2 {
            if let configuracoesVC = storyboard?.instantiateViewController(withIdentifier: "configuracoesVC") as? ConfiguracoesViewController {
                configuracoesVC.navigationItem.largeTitleDisplayMode = .never
                navigationController?.pushViewController(configuracoesVC, animated: true)
            }
        }
        if indexPath.row == 3 {
            if let ajudaVC = storyboard?.instantiateViewController(withIdentifier: "ajudaVC") as? AjudaViewController {
                ajudaVC.navigationItem.largeTitleDisplayMode = .never
                navigationController?.pushViewController(ajudaVC, animated: true)
            }
        }
    }
}

extension PerfilViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "userPerfilCell") as? UserPerfilTableViewCell
            cell?.setupUserCell(viewModel: UserPerfilTableViewCellViewModel(user: userPerfil))
            return cell ?? UITableViewCell()
        }
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "optionsPerfilCell") as? OptionsPerfilTableViewCell
            cell?.setupOptionCell(viewModel: OptionsPerfilTableViewCellViewModel(option: optionsPerfil[indexPath.row]))
            return cell ?? UITableViewCell()
        }
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSection
    }
}

