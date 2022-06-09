//
//  HistoricoCellViewModel.swift
//  MovieRoll
//
//  Created by Renato Yoshinari on 06/06/22.
//

import Foundation

class HistoricoCellViewModel {
    
    private let filme: Filme?
    
    init(filme: Filme?) {
        self.filme = filme
    }
    
    var getImage: String {
        return filme?.image ?? ""
    }
}

