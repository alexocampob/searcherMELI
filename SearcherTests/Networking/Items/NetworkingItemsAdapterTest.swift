//
//  NetworkingItemsAdapterTest.swift
//  Searcher
//
//  Created by David Alexander Ocampo Barbosa on 22/09/20.
//  Copyright (c) 2020 David Alexander Ocampo Barbosa. All rights reserved.
//

import XCTest
@testable import Searcher

final class NetworkingItemsAdapterTest: XCTestCase {
    
    var sut: NetworkingItemsAdapter!
    var jsonSearchItemResultSuccess = "searchItemResult"
    
    override func setUp() {
        super.setUp()
        sut = NetworkingItemsAdapter()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func test_getItemsByQuerySuccess() {
        // Given
        self.setupNetworkingItemsAdapter(file: jsonSearchItemResultSuccess, code: 200)
        
        // When //Then
        sut.getItemsBy(query: "test") { (response) in
            switch response {
            case .success(let data):
                XCTAssertNotNil(data)
            case .failure(let error):
                XCTAssertNil(error)
            }
        }
    }
    
    func test_getItemsByQueryFailed() {
        // Given
        self.setupNetworkingItemsAdapter(code: 500, error: ErrorType.serverFailed)
        
        // When // Then
        sut.getItemsBy(query: "test") { (response) in
            switch response {
            case .success(let data):
                XCTAssertNil(data)
            case .failure(let error):
                XCTAssertNotNil(error)
            }
        }
    }
    
    private func setupNetworkingItemsAdapter(file: String = String(), code: Int, error: Error? = nil) {
        let session = MockSession.shared.createMockSession(fromJsonFile: file, andStatusCode: code, andError: error, as: NetworkingItemsAPI.self)
        let request = NetworkingItemsSession(session)
        sut = NetworkingItemsAdapter(request)
    }
}
