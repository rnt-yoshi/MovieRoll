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
    
    func tableViewCell(tableView: UITableView, section: Int) -> UITableViewCell {
        if section == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "userPerfilCell") as? UserPerfilTableViewCell {
                return cell
            }
        }
        if section == 1 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "optionsPerfilCell") as? OptionsPerfilTableViewCell {
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func getCellViewModel(section: Int, row: Int) -> CellTableViewModel {
        var option = OptionsPerfil(titulo: "", subtitulo: "", imagem: "")
        if section == 0 {
            option = userPerfil
        }
        if section == 1 {
            option = optionsPerfil[row]
        }
        return CellTableViewModel(option: option)
    }
}
