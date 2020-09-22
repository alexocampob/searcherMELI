//
//  ProductDetailRouter.swift
//  Searcher
//
//  Created by David Alexander Ocampo Barbosa on 18/09/20.
//  Copyright (c) 2020 David Alexander Ocampo Barbosa. All rights reserved.
//

import UIKit

final class ProductDetailRouter: ProductDetailRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static func createProductDetailModule(with model: Item) -> ProductDetailViewController {
        let ref = ProductDetailViewController.instantiate(from: .productDetail)
        
        let presenter: ProductDetailPresenterProtocol & ProductDetailInteractorOutputProtocol = ProductDetailPresenter(item: model)
        
        let router = ProductDetailRouter()
        router.viewController = ref
        
        let interactor = ProductDetailInteractor()
        interactor.presenter = presenter
        
        presenter.view = ref
        presenter.router = router
        presenter.interactor = interactor
        
        ref.presenter = presenter
        return ref
    }
    
    func popController() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}

