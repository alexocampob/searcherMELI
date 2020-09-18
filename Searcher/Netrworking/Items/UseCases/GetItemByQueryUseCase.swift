//
//  GetItemByQueryUseCase.swift
//  Searcher
//
//  Created by David Alexander Ocampo Barbosa on 14/09/20.
//  Copyright © 2020 David Alexander Ocampo Barbosa. All rights reserved.
//

import Foundation

/*
 Use case to receive a list of items sith a string query
 */
struct GetItemByQueryUseCase {
    struct Response: Codable {
        var results: [Results]

        enum CodingKeys: String, CodingKey {
            case results = "results"
        }
    }
    
    struct Results: Codable {
        var id: String
        var title: String
        var price: Double
        var thumbnail: String
        
        enum CodingKeys: String, CodingKey {
            case id = "id"
            case title = "title"
            case price = "price"
            case thumbnail = "thumbnail"
        }
    }
}
