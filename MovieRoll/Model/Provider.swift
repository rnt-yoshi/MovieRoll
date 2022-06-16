//
//  Provider.swift
//  MovieRoll
//
//  Created by Bruno Bezerra on 16/06/22.
//

import Foundation



struct Provider: Codable {
    var id: Int
    var results: ProvidersResults
}
struct BR: Codable {
    var flatrate: [Flatrate]
}

struct ProvidersResults: Codable {
    var BR: BR
}

struct Flatrate: Codable {
    var displayPriority: Int
    var providerId: Int
    
    enum CodingKeys: String, CodingKey {
        case displayPriority = "display_priority"
        case providerId = "provider_id"
    }
    
}
