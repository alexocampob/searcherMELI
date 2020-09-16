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
        var siteID: SiteID?
        var title: String
        var price: Double
        var thumbnail: String
        
        enum CodingKeys: String, CodingKey {
            case id = "id"
            case siteID = "site_id"
            case title = "title"
            case price = "price"
            case thumbnail = "thumbnail"
        }
        
        enum SiteID: String, Codable {
            case mla = "MLA"
        }
//
//        init(from decoder: ADecoder) throws {
//            let container = try decoder
//            id = try container.decodeIfPresent(String.self, forKey: .id) ?? String()
//            site_id = try container.decodeIfPresent(String.self, forKey: .site_id) ?? String()
//            title = try container.decodeIfPresent(String.self, forKey: .title) ?? String()
//            price = try container.decodeIfPresent(String.self, forKey: .price) ?? String()
//            thumbnail = try container.decodeIfPresent(String.self, forKey: .thumbnail) ?? String()
//        }
    }
}
