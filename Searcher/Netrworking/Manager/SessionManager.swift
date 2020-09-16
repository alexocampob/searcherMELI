//
//  SessionManager.swift
//  Searcher
//
//  Created by David Alexander Ocampo Barbosa on 14/09/20.
//  Copyright © 2020 David Alexander Ocampo Barbosa. All rights reserved.
//

import Foundation

typealias NetworkSessionCompletion = (_ data: Data?,
    _ response: HTTPURLResponse?,
    _ error: Error?) -> Void

protocol NetworkSession: class {
    /*
     Restrict the type of element for implementation
     */
    associatedtype EndPoint: EndPointType
    
    /*
     Make a URL request to an external source
     
     :param:  route EndPoint type to be called
     :param: completion the response callback
     */
    func request(_ route: EndPoint, completion: @escaping NetworkSessionCompletion)
}

// Manage connection to URL session
class SessionManager<EndPoint: EndPointType>: NetworkSession {
    let session = URLSession.shared
    
    func request(_ endpoint: EndPoint, completion: @escaping NetworkSessionCompletion) {
        //Full url string
        let fullURL = endpoint.baseURL.appendingPathComponent(endpoint.path).absoluteString.removingPercentEncoding
        let url = URL(string: fullURL ?? String()) ?? endpoint.baseURL.appendingPathComponent(endpoint.path)
        
        //Defines url request
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.httpMethod.rawValue
        urlRequest.httpBody = endpoint.httpMethod == .get ? nil : endpoint.data
        
        //Configure headers
        urlRequest.allHTTPHeaderFields = endpoint.headers
        
        //Add query items to url if needed
        if endpoint.httpMethod == .get {
            var newURL = URLComponents(string: urlRequest.url?.absoluteString ?? String())
            newURL?.queryItems = endpoint.parameters?.map({ (key: String, value: Any) -> URLQueryItem in
                URLQueryItem(name: key, value: "\(value)")
            })
            urlRequest.url = newURL?.url
        }
        
        //Execute the request
        let task = session.dataTask(with: urlRequest) { data, response, error in
            DispatchQueue.main.async {
                //Completion callback
                guard let response = response as? HTTPURLResponse,
                    HTTPResponseCodeStatus(code: response.statusCode) == .success else {
                        completion(nil, nil, ErrorType.serverFailed)
                        return
                }
                completion(data, response, nil)
            }
        }
        task.resume()
    }
}
