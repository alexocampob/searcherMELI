//
//  SearchItemRouter.swift
//  Searcher
//
//  Created by David Alexander Ocampo Barbosa on 14/09/20.
//  Copyright (c) 2020 David Alexander Ocampo Barbosa. All rights reserved.
//

import UIKit

final class SearchItemRouter: SearchItemRouterProtocol {
    
    weak var viewController: SearchItemViewProtocol?
    
    /*
     Create and assign all dependencies
     */
    static func createSearchItemModule(with ref: SearchItemViewProtocol) {
        //let ref = SearchItemViewController.instantiate(from: .searchItem)
        
        let presenter: SearchItemPresenterProtocol & SearchItemInteractorOutputProtocol = SearchItemPresenter()
        
        let router = SearchItemRouter()
        router.viewController = ref
        
        let interactor = SearchItemInteractor()
        interactor.presenter = presenter
        
        presenter.view = ref
        presenter.router = router
        presenter.interactor = interactor
        
        ref.presenter = presenter
    }
}

