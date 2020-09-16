//
//  HTTP+Utils.swift
//  Searcher
//
//  Created by David Alexander Ocampo Barbosa on 14/09/20.
//  Copyright © 2020 David Alexander Ocampo Barbosa. All rights reserved.
//

import Foundation

// Common http responses
enum HTTPResponseCodeStatus {
    case informational
    case success
    case redirection
    case clientError
    case serverError
    case unknown
    
    init(code: Int) {
        switch code {
        case 100...199:
            self = .informational
        case 200...299:
            self = .success
        case 300...399:
            self = .redirection
        case 400...499:
            self = .clientError
        case 500...599:
            self = .serverError
        default:
            self = .unknown
        }
    }
}

// Common http methods
enum HTTPMethod: String {
    case connect = "CONNECT"
    case delete = "DELETE"
    case get = "GET"
    case head = "HEAD"
    case options = "OPTIONS"
    case patch = "PATCH"
    case post = "POST"
    case put = "PUT"
    case trace = "TRACE"
}

// Common http header tag
enum HTTPHeaderTag: String {
    case contentType = "Content-Type"
}
