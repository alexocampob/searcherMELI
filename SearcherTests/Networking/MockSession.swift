//
//  MockSession.swift
//  SearcherTests
//
//  Created by David Alexander Ocampo Barbosa on 22/09/20.
//  Copyright © 2020 David Alexander Ocampo Barbosa. All rights reserved.
//

import XCTest
@testable import Searcher

class MockSessionSearcher<EndPoint: EndPointType>: NetworkSession {
    var completionHandler: (Data?, HTTPURLResponse?, Error?)
    private var printEndPointData: Bool = false
    init(completionHandler: (Data?, HTTPURLResponse?, Error?), printEndPointData: Bool = false) {
        self.printEndPointData = printEndPointData
        self.completionHandler = completionHandler
    }
    
    func request(_ route: EndPoint, completion: @escaping NetworkSessionCompletion) {
        self.printEnpointInformation(route)
        completion(self.completionHandler.0, self.completionHandler.1, self.completionHandler.2)
    }
    
    private func printEnpointInformation(_ route: EndPoint) {
        if printEndPointData {
            print("\n\n\n\t🔈 -START- 🔈" +
                "\n🔈 -\(String(describing: route.self))- 🔈" +
                "\n🔈 PATH: \(route.path) 🔈" +
                self.printData(data: route.data) +
                "\n🔈 HTTPMethod: \(route.httpMethod) 🔈" +
                "\n🔈 Parameters: \(String(describing: route.parameters)) 🔈" +
                "\n🔈 HTTPHeaders: \(String(describing: route.headers)) 🔈" +
                "\n\t🔈 -END- 🔈\n\n\n")
        }
    }
    
    private func printData(data: Data?) -> String {
        if let data = data, let json = try? JSONSerialization.jsonObject(with: data, options: []) {
            return "\n🔈 DATA JSON: \(json) 🔈"
        }
        return String()
    }
}

class MockSession {
    static var shared = MockSession()
        
        private init() {}
        
        private func loadJsonData(file: String) -> Data? {
            if let jsonFilePath = Bundle(for: type(of: self)).path(forResource: file, ofType: "json") {
                let jsonFileURL = URL(fileURLWithPath: jsonFilePath)
                
                if let jsonData = try? Data(contentsOf: jsonFileURL) {
                    return jsonData
                }
            }
            return nil
        }
        
        func createMockSession<T: EndPointType>(fromJsonFile file: String = String(),
                                                andStatusCode code: Int,
                                                andError error: Error? = nil, as type: T.Type = T.self,
                                                headers: HTTPHeaders? = nil) -> MockSessionSearcher<T> {
            
            let data = file.isEmpty ? nil : loadJsonData(file: file)
            let response = HTTPURLResponse(
                url: URL(string: "TESTUrl")!,
                statusCode: code,
                httpVersion: nil,
                headerFields: headers)
            return MockSessionSearcher<T>(completionHandler: (data, response, error), printEndPointData: true)
        }
}
