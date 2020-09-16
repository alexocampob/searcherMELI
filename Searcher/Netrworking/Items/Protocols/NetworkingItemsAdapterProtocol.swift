//
//  NetworkingItemsAdapterProtocol.swift
//  Searcher
//
//  Created by David Alexander Ocampo Barbosa on 14/09/20.
//  Copyright © 2020 David Alexander Ocampo Barbosa. All rights reserved.
//

import Foundation

protocol NetworkingItemsAdapterProtocol {
    var request: NetworkingItemsRequestProtocol { get set }
    func getItemsBy(query: String, completion: @escaping (_ result: RequestResult<GetItemByQueryUseCase.Response, Error>) -> Void)
}

protocol NetworkingItemsSessionProtocol {
    associatedtype Session: NetworkSession
    var session: Session { get set }
}

protocol NetworkingItemsRequestProtocol {
    func requestItemsBy(query: String, completion: @escaping NetworkSessionCompletion)
}
