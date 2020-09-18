//
//  ProductDetailProtocols.swift
//  Searcher
//
//  Created by David Alexander Ocampo Barbosa on 18/09/20.
//  Copyright (c) 2020 David Alexander Ocampo Barbosa. All rights reserved.
//
import UIKit

protocol ProductDetailInteractorProtocol: AnyObject {
    var presenter: ProductDetailInteractorOutputProtocol? { get set }
}

protocol ProductDetailPresenterProtocol: AnyObject {
    var view: ProductDetailViewProtocol? { get set }
    var router: ProductDetailRouterProtocol? { get set }
    var interactor: ProductDetailInteractorProtocol? { get set }
}

protocol ProductDetailInteractorOutputProtocol: AnyObject {
}

protocol ProductDetailRouterProtocol: AnyObject {
    var viewController: UIViewController? { get set }
    
    static func createProductDetailModule() -> ProductDetailViewController
}

protocol ProductDetailViewProtocol: AnyObject {
    var presenter: ProductDetailPresenterProtocol? { get set }
}
