//
//  ProductDetailPresenter.swift
//  Searcher
//
//  Created by David Alexander Ocampo Barbosa on 18/09/20.
//  Copyright (c) 2020 David Alexander Ocampo Barbosa. All rights reserved.
//

final class ProductDetailPresenter: ProductDetailPresenterProtocol {
    
    weak var view: ProductDetailViewProtocol?
    var router: ProductDetailRouterProtocol?
    var interactor: ProductDetailInteractorProtocol?
}

extension ProductDetailPresenter: ProductDetailInteractorOutputProtocol {}
