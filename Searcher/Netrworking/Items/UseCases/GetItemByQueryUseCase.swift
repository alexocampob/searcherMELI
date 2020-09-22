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
        var availableQuantity: Double
        var condition: Condition
        var installments: Installment
        var shipping: Shipping
        
        enum CodingKeys: String, CodingKey {
            case id = "id"
            case title = "title"
            case price = "price"
            case thumbnail = "thumbnail"
            case availableQuantity = "availableQuantity"
            case condition = "condition"
            case installments = "installments"
            case shipping = "shipping"
        }
    }
    
    struct Installment: Codable {
        var quantity: Double
        var amount: Double
    }
    
    struct Shipping: Codable {
        var freeShipping: Bool
    }
}

enum Condition: String, Codable {
    case new
    case used
}
