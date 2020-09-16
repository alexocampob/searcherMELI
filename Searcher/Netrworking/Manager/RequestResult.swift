//
//  RequestResult.swift
//  Searcher
//
//  Created by David Alexander Ocampo Barbosa on 14/09/20.
//  Copyright © 2020 David Alexander Ocampo Barbosa. All rights reserved.
//

import Foundation

enum RequestResult<T, U> {
    case success(T)
    case failure(U)
}
