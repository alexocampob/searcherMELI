//
//  NetworkingItemsAdapter.swift
//  Searcher
//
//  Created by David Alexander Ocampo Barbosa on 14/09/20.
//  Copyright © 2020 David Alexander Ocampo Barbosa. All rights reserved.
//

import Foundation
/*
 Adapter class called by interactor
 */
class NetworkingItemsAdapter: NetworkingItemsAdapterProtocol {
    var request: NetworkingItemsRequestProtocol
    
    init(_ request: NetworkingItemsRequestProtocol = NetworkingItemsSession(SessionManager<NetworkingItemsAPI>())) {
        self.request = request
    }
    
    /*
     Obtain a list of items by a string query
     */
    func getItemsBy(query: String, completion: @escaping (RequestResult<GetItemByQueryUseCase.Response, Error>) -> Void) {
        request.requestItemsBy(query: query) { (data, response, error) in
            guard let error = error else {
                // Handle the json decoding
                do {
                    let contentResponse: GetItemByQueryUseCase.Response = try Decoder.decodeResponse(data: data)
                    completion(.success(contentResponse))
                } catch {
                    completion(.failure(ErrorType.noDecodeData))
                }
                return
            }
            //Request failed
            completion(.failure(error))
        }
    }
}
