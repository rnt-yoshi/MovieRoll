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
        let cell = viewModel.tableViewCell(tableView: tableView, indexPath: indexPath)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSection
    }
}
