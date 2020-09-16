//
//  NetworkingItemsAPI.swift
//  Searcher
//
//  Created by David Alexander Ocampo Barbosa on 11/09/20.
//  Copyright © 2020 David Alexander Ocampo Barbosa. All rights reserved.
//

import Foundation

/*
 Obtener ítems de una consulta de búsqueda.
 
 https://api.mercadolibre.com/sites/$SITE_ID/search?q=Motorola%20G6
 */
enum NetworkingItemsAPI {
    case searchItemBy(query: String)
}

/*
 Specific implementation for EndPointType
 */
extension NetworkingItemsAPI: EndPointType {
    //Defines the url query
    var path: String {
        let subPath = "/sites"
        
        //Hardcoded siteId could be a parameter
        let siteId = "MLA"
        
        switch self {
        case .searchItemBy:
            return subPath + "/\(siteId)/search"
        }
    }
    
    //Only for requestt with body parameters
    var data: Data? {
        switch self {
        default: return nil
        }
    }
        
    //HTTTP method type for request
    var httpMethod: HTTPMethod {
        switch self {
        case .searchItemBy:
            return .get
        }
    }
    
    //Parameters for url request
    var parameters: Parameters? {
        switch self {
        case .searchItemBy(let query):
            return ["q": query]
        }
    }
    
    /*
     Formatt space for searching query parameter
     */
    private func formatQuery(query: String) -> String {
        return query.replacingOccurrences(of: " ", with: "%20")
    }
}
