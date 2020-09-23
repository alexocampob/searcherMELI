//
//  SearchItemInteractorTest.swift
//  Searcher
//
//  Created by David Alexander Ocampo Barbosa on 22/09/20.
//  Copyright (c) 2020 David Alexander Ocampo Barbosa. All rights reserved.
//

import XCTest
@testable import Searcher

final class SearchItemInteractorTest: XCTestCase {
    
    var mockPresenter: MockPresenter!
    var sut: SearchItemInteractor!
    var jsonSearchItemResultSuccess = "searchItemResult"
    
    override func setUp() {
        super.setUp()
        mockPresenter = MockPresenter()
        sut = SearchItemInteractor()
        sut.presenter = mockPresenter
    }
    
    override func tearDown() {
        super.tearDown()
        mockPresenter = nil
        sut = nil
    }
    
    func test_searchItemsByQuery_whenSuccess() {
        // Given
        self.setupNetworkingItemsAdapter(file: jsonSearchItemResultSuccess, code: 200)
        
        // When
        sut.searchItemsBy(query: "test")
        
        // Then
        XCTAssertTrue(mockPresenter.onSearchItemSuccessCalled)
    }
    
    func test_searchItemsByQuery_whenFailed() {
        // Given
        self.setupNetworkingItemsAdapter(code: 500,
                                         error: ErrorType.serverFailed)
        
        // When
        sut.searchItemsBy(query: "test")
        
        // Then
        XCTAssertTrue(mockPresenter.onSearchItemFailedCalled)
    }
    
    class MockPresenter: SearchItemInteractorOutputProtocol {
        var onSearchItemSuccessCalled = false
        var onSearchItemFailedCalled = false
        
        func onSearchItemSuccess(with items: [Item]) {
            onSearchItemSuccessCalled = true
        }
        
        func onSearchItemFailed(with error: Error) {
            onSearchItemFailedCalled = true
        }
    }
    
    /**
     Inyección de dependencias para mockear la capa de networking
     */
    private func setupNetworkingItemsAdapter(file: String = String(), code: Int, error: Error? = nil) {
            let session = MockSession.shared.createMockSession(fromJsonFile: file,
                                                              andStatusCode: code,
                                                              andError: error,
                                                              as: NetworkingItemsAPI.self)
            let request = NetworkingItemsSession(session)
            sut.networkingItemsAdapter = NetworkingItemsAdapter(request)
        }
    
    struct DummyData {
        
    }
}
