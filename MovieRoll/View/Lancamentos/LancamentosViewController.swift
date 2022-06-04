//
//  InicioViewController.swift
//  MovieRoll
//
//  Created by Renato Yoshinari on 26/05/22.
//

import UIKit

class LancamentosViewController: UIViewController {
    
    @IBOutlet weak var lancamentosTableView: UITableView!
    
    var viewModel = LancamentosTableViewModel ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lancamentosTableView.dataSource = self
        lancamentosTableView.delegate = self
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
        let cell = lancamentosTableView.dequeueReusableCell(withIdentifier: "idCellTable", for: indexPath) as? LancamentosTableViewCell
        
        return cell ?? UITableViewCell()
    }
    
}

extension LancamentosViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let tableHeader = view as! UITableViewHeaderFooterView
        tableHeader.tintColor = UIColor.clear
        tableHeader.textLabel?.textColor = .white
        //        tableHeader.textLabel?.font = UIFont(name: "Helvetica-Neue", size: 25)
        //        tableHeader.textLabel?.font = UIFont.boldSystemFont(ofSize: 25)
    }
    
}
