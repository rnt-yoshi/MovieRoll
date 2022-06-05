//
//  RoletaViewModel.swift
//  MovieRoll
//
//  Created by Artur Franca on 04/06/22.
//

import Foundation

class RoletaViewModel {
        
    let service = Service()
    
    private var anos: [String] = [
    "1970",
    "1980",
    "1990",
    "2000",
    "2010",
    "2020",
    "2021",
    "2022"
    ]
    
    var dataInicial = ""
    var dataFinal = ""
    
    var getPlataformas: [String] {
        return service.plataformas
    }
    
    var numberOfItems: Int {
        return service.plataformas.count
    }
    
    func getImage(index: Int) -> String {
        return service.plataformas[index]
    }
    
    var numberComponents: Int {
        return 2
    }
    
    var numberOfRows: Int {
        return anos.count
    }
    
    func titleForRow(row: Int) -> String {
        return anos[row]
    }
    
    func getTitleForTextField(row: Int, componente: Int) -> String {
     
        if componente == 0 {
            dataInicial = anos[row]
        } else {
            dataFinal = anos[row]
        }

        return "De \(dataInicial) Até \(dataFinal)"
    }
}
