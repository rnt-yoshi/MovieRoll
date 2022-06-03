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
    
}

extension PerfilViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = viewModel.tableViewCell(tableView: tableView, section: indexPath.section)
//        let cellViewModel = viewModel.getCellViewModel(section: indexPath.section, row: indexPath.row)
//        cell.
//        return cell
        if indexPath.section < 1 {
            if let cell = perfilTableView.dequeueReusableCell(withIdentifier: "userPerfilCell", for: indexPath) as? UserPerfilTableViewCell {
                cell.setupUserCell(user: userPerfil)
                return cell
            }
        } else {
            if let cell = perfilTableView.dequeueReusableCell(withIdentifier: "optionsPerfilCell", for: indexPath) as? OptionsPerfilTableViewCell {
                cell.setupOptionCell(dados: optionsPerfil[indexPath.row])
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSection
    }
}
