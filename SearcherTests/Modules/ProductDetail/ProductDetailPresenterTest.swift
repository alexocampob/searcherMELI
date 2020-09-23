//
//  ProductDetailPresenterTest.swift
//  Searcher
//
//  Created by David Alexander Ocampo Barbosa on 22/09/20.
//  Copyright (c) 2020 David Alexander Ocampo Barbosa. All rights reserved.
//

import XCTest
@testable import Searcher

final class ProductDetailPresenterTest: XCTestCase {
    
    var mockView: MockView!
    var mockRouter: MockRouter!
    var mockInteractor: MockInteractor!
    var sut: ProductDetailPresenter!
    
    override func setUp() {
        super.setUp()
        mockView = MockView()
        mockRouter = MockRouter()
        mockInteractor = MockInteractor()
        sut = ProductDetailPresenter(item: DummyData.item)
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
    
    func test_viewDidLoad() {
        //When
        sut.viewDidLoad()
        
        //Then
        XCTAssertTrue(mockView.setViewCalled)
    }
    
    func test_onBackTapped() {
        //When
        sut.onBackTapped()
        
        //Then
        XCTAssertTrue(mockRouter.popControllerCalled)
    }
    
    class MockView: ProductDetailViewProtocol {
        var presenter: ProductDetailPresenterProtocol?
        var setViewCalled = false
        
        func setView(with productDetail: ProductDetail) {
            setViewCalled = true
        }
    }
    
    class MockRouter: ProductDetailRouterProtocol {
        var viewController: UIViewController?
        var popControllerCalled = false
        
        static func createProductDetailModule(with model: Item) -> ProductDetailViewController {
            return ProductDetailViewController()
        }
        
        func popController() {
            popControllerCalled = true
        }
    }
    
    class MockInteractor: ProductDetailInteractorProtocol {
        var presenter: ProductDetailInteractorOutputProtocol?
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
        
        static var productDetail = ProductDetail(thumbnail: "http://http2.mlstatic.com/D_824829-MLA41972019110_052020-I.jpg",
                                                 title: "title",
                                                 price: "$ 100000",
                                                 condition: "Nuevo",
                                                 availableQuantity: "50",
                                                 installmentDescription: "12 cuotas de $ 500",
                                                 shipping: "Envío gratis a nivel nacional")
    }
}
