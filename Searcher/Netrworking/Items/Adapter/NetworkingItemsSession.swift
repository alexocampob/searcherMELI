//
//  NetworkingItemsSession.swift
//  Searcher
//
//  Created by David Alexander Ocampo Barbosa on 14/09/20.
//  Copyright © 2020 David Alexander Ocampo Barbosa. All rights reserved.
//

import Foundation


/*
 Generic type to restrict another type of API
 Session bring apart to make testing easily
 */
class NetworkingItemsSession<Session: NetworkSession>: NetworkingItemsSessionProtocol, NetworkingItemsRequestProtocol where Session.EndPoint == NetworkingItemsAPI {
    var session: Session
    
    init(_ session: Session) {
        self.session = session
    }
    
    func requestItemsBy(query: String, completion: @escaping NetworkSessionCompletion) {
        session.request(.searchItemBy(query: query)) { (data, response, error) in
            completion(data, response, error)
        }
    }
}
