//
//  SearchItemPresenterTest.swift
//  Searcher
//
//  Created by David Alexander Ocampo Barbosa on 22/09/20.
//  Copyright (c) 2020 David Alexander Ocampo Barbosa. All rights reserved.
//

import XCTest
@testable import Searcher

final class SearchItemPresenterTest: XCTestCase {
    
    var mockView: MockView!
    var mockRouter: MockRouter!
    var mockInteractor: MockInteractor!
    var sut: SearchItemPresenter!
    
    override func setUp() {
        super.setUp()
        mockView = MockView()
        mockRouter = MockRouter()
        mockInteractor = MockInteractor()
        sut = SearchItemPresenter()
        sut.view = mockView
        sut.router = mockRouter
        sut.interactor = mockInteractor
    }
    
    override func tearDown() {
        super.tearDown()
        mockView = nil
        mockRouter = nil
        mockInteractor = nil
        sut = nil
    }
    
    func test_serchItemsBy_whenQueryEmpty() {
        //Given
        sut.searchingWorkItem = DispatchWorkItem {}
        
        //When
        sut.searchItemsBy(query: String())
        
        //Then
        XCTAssertTrue(mockView.resetSearchStateCalled)
    }
    
    func test_serchItemsBy_whenQueryIsNotEmpty() {
        //Given
        let expect = expectation(description: "Execute completion searching items")
        
        //When
        sut.searchItemsBy(query: "test")
        
        //Then
        sut.searchingWorkItem?.notify(queue: .main, execute: {
            XCTAssertTrue(self.mockInteractor.searchItemsByCalled)
            expect.fulfill()
        })
        
        waitForExpectations(timeout: 0.4) { (error) in
            if let _ = error {
                XCTFail("Error on completion execution")
            }
        }
        XCTAssertNotNil(sut.searchingWorkItem)
    }
    
    func test_showProductDetail() {
        //When
        sut.showProductDetail(with: DummyData.item)
        
        //Then
        XCTAssertTrue(mockRouter.showProductDetailCalled)
    }
    
    func test_onSearchItemFailed() {
        //When
        sut.onSearchItemFailed(with: ErrorType.serverFailed)
        
        //Then
        XCTAssertTrue(mockRouter.showErrorAlertCalled)
        XCTAssertTrue(mockView.resetSearchStateCalled)
    }
    
    func test_onSearchItemSuccess_whenNotEmpty() {
        //When
        sut.onSearchItemSuccess(with: [DummyData.item])
        
        //Then
        XCTAssertTrue(mockView.clearSearchedItemsCalled)
        XCTAssertTrue(mockView.showSearchResultCalled)
    }
    
    func test_onSearchItemSuccess_whenEmpty() {
        //When
        sut.onSearchItemSuccess(with: [])
        
        //Then
        XCTAssertTrue(mockView.showEmptySearchMessageCalled)
    }
    
    class MockView: SearchItemViewProtocol {
        var presenter: SearchItemPresenterProtocol?
        var showSearchResultCalled = false
        var resetSearchStateCalled = false
        var clearSearchedItemsCalled = false
        var showEmptySearchMessageCalled = false
        
        func showSearchResult(with items: [Item]) {
            showSearchResultCalled = true
        }
        
        func resetSearchState() {
            resetSearchStateCalled = true
        }
        
        func clearSearchedItems() {
            clearSearchedItemsCalled = true
        }
        
        func showEmptySearchMessage() {
            showEmptySearchMessageCalled = true
        }
    }
    
    class MockRouter: SearchItemRouterProtocol {
        var viewController: UIViewController?
        var showErrorAlertCalled = false
        var showProductDetailCalled = false
        
        static func createSearchItemModule() -> UIViewController {
            return SearchItemViewController()
        }
        
        func showErrorAlert() {
            showErrorAlertCalled = true
        }
        
        func showProductDetail(with item: Item) {
            showProductDetailCalled = true
        }
    }
    
    class MockInteractor: SearchItemInteractorProtocol {
        var presenter: SearchItemInteractorOutputProtocol?
        var networkingItemsAdapter: NetworkingItemsAdapterProtocol?
        var searchItemsByCalled = false
        
        func searchItemsBy(query: String) {
            searchItemsByCalled = true
        }
    }
    
    struct DummyData {
        static var item = Item(thumbnail: "http://http2.mlstatic.com/D_824829-MLA41972019110_052020-I.jpg",
                               title: "title",
                               price: 10000,
                               condition: "new",
                               availableQuantity: 50,
                               numberInstallments: 12,
                               valueInstallment: 80,
                               freeShipping: true)
    }
}
