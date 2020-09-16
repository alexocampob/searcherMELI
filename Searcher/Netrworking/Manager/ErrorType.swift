//
//  ErrorType.swift
//  Searcher
//
//  Created by David Alexander Ocampo Barbosa on 14/09/20.
//  Copyright © 2020 David Alexander Ocampo Barbosa. All rights reserved.
//

import Foundation

/*
 Common error types
 */
public enum ErrorType: Error {
    case badRequest
    case serverFailed
    case nilResult
    case noDecodeData
    
    var localizedDescription: String {
        switch self {
        case .badRequest:
            return "Bad request"
        case .serverFailed:
            return "Server failed"
        case .nilResult:
            return "Result nil"
        case .noDecodeData:
            return "Response not decoded"
        }
    }
}
