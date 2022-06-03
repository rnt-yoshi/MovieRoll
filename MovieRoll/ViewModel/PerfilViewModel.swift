//
//  PerfilViewModel.swift
//  MovieRoll
//
//  Created by Renato Yoshinari on 03/06/22.
//

import Foundation
import UIKit

class PerfilViewModel {
    
    private var identifierCell: [String] {
        return [
            "userPerfilCell",
            "optionsPerfilCell"
        ]
    }
    
    var numberOfSection: Int {
        return identifierCell.count
    }
    
    func numberOfRows(section: Int) -> Int {
        if section == 0 {
            return 1
        }
        if section == 1 {
            return optionsPerfil.count
        }
        return 0
    }
    
    func tableViewCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "userPerfilCell") as? UserPerfilTableViewCell {
                cell.setupUserCell(viewModel: UserPerfilTableViewCellViewModel(user: userPerfil))
                return cell
            }
        }
        if indexPath.section == 1 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "optionsPerfilCell") as? OptionsPerfilTableViewCell {
                cell.setupOptionCell(viewModel: OptionsPerfilTableViewCellViewModel(option: optionsPerfil[indexPath.row]))
                return cell
            }
        }
        return UITableViewCell()
    }
}
