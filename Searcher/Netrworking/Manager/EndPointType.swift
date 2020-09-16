//
//  EndPointType.swift
//  Searcher
//
//  Created by David Alexander Ocampo Barbosa on 14/09/20.
//  Copyright © 2020 David Alexander Ocampo Barbosa. All rights reserved.
//

import Foundation

typealias Parameters = [String: Any]
typealias HTTPHeaders = [String: String]

/*
 Defines the basic structure of an endpoint
 */
protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var data: Data? { get }
    var parameters: Parameters? { get }
    var headers: HTTPHeaders? { get }
    var httpMethod: HTTPMethod { get }
}

extension EndPointType {
    //Base url for request
    var baseURL: URL {
        guard let url = URL(string: "https://api.mercadolibre.com") else {
            fatalError("baseURL could not be configured.")
        }
        return url
    }
    
    //Headerx for urk request
    var headers: HTTPHeaders? {
        return [HTTPHeaderTag.contentType.rawValue: "application/json"]
    }
}
