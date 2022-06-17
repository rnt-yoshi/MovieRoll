//
//  Provider.swift
//  MovieRoll
//
//  Created by Bruno Bezerra on 16/06/22.
//

import Foundation

class Provider: Decodable {
    let providerId: Int
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let results = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .results)
        let br = try results.nestedContainer(keyedBy: CodingKeys.self, forKey: .br)
        let flatrate = try br.decode([Flatrate].self, forKey: .flatrate)
        providerId = flatrate.first?.providerId ?? 0
    }
    
    enum CodingKeys: String, CodingKey {
        case results
        case br = "BR"
        case flatrate
        case providerId = "provider_id"
    }
}

class Flatrate: Decodable {
    let providerId: Int
    
    enum CodingKeys: String, CodingKey {
        case providerId = "provider_id"
    }
}
