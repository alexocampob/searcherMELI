//
//  NetworkingLogger.swift
//  Searcher
//
//  Created by David Alexander Ocampo Barbosa on 18/09/20.
//  Copyright © 2020 David Alexander Ocampo Barbosa. All rights reserved.
//

import Foundation

class NetworkingLogger {
    /*
     Funcion estatica que imprime el log de un url request
     */
    static func log(request: URLRequest) {
        
        Logger.info("\n - - - - - - - - - - REQUEST - - - - - - - - - - \n")
        defer { Logger.info("\n - - - - - - - - - - REQUEST END - - - - - - - - - - \n") }
        
        let urlAsString = request.url?.absoluteString ?? String()
        let urlComponents = NSURLComponents(string: urlAsString)
        
        let method = request.httpMethod != nil ? "\(request.httpMethod ?? String())" : String()
        let path = "\(urlComponents?.path ?? String())"
        let query = "\(urlComponents?.query ?? String())"
        let host = "\(urlComponents?.host ?? String())"
        
        var logOutput = """
                        URL: \(urlAsString)\n
                        METHOD: \(method)\n
                        QUERY: \(path)\(query)\n
                        HOST: \(host)\n
                        """
        for (key,value) in request.allHTTPHeaderFields ?? [:] {
            logOutput += "\(key): \(value) \n"
        }
        if let body = request.httpBody {
            logOutput += "\n \(NSString(data: body, encoding: String.Encoding.utf8.rawValue) ?? "")"
        }
        
        Logger.info(logOutput)
    }
    
    /*
     Funcion estatica que imprime el log de la respuesta de un URL request
     */
    static func log(response: HTTPURLResponse, data: Data?) {
        Logger.info("\n - - - - - - - - - - RESPONSE - - - - - - - - - - \n")
        defer { Logger.info("\n - - - - - - - - - - RESPONSE END - - - - - - - - - - \n") }
        guard let data = data else {
            Logger.error("Data object nil")
            return
        }
        do {
            let body = try JSONSerialization.jsonObject(with: data, options: [])
            let logOutput = """
                            STATUS CODE: \(response.statusCode) \n\n
                            BODY: \(body)
                            """
            Logger.info(logOutput)
        } catch (let error) {
            Logger.error(error)
        }
    }
}
