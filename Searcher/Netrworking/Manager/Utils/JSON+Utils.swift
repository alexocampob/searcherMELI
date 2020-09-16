//
//  JSON+Utils.swift
//  Searcher
//
//  Created by David Alexander Ocampo Barbosa on 14/09/20.
//  Copyright © 2020 David Alexander Ocampo Barbosa. All rights reserved.
//

import Foundation

class Decoder {
    static func decodeResponse<T: Decodable> (data: Data?, as type: T.Type = T.self) throws -> T {
        guard let data = data else { throw ErrorType.noDecodeData }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(T.self, from: data)
        } catch {
            print("ERROR PARSE DATA: \(error)")
            throw ErrorType.noDecodeData
        }
    }
}
