//
//  RoletaViewModel.swift
//  MovieRoll
//
//  Created by Artur Franca on 04/06/22.
//

import Foundation

class RoletaViewModel {
    
    let service = Service()
    
    var getPlataformas: [String] {
        return service.plataformas
    }
    
    var numberOfItems: Int {
        return service.plataformas.count
    }
    
    func getImage(index: Int) -> String {
        return service.plataformas[index]
    }
}
