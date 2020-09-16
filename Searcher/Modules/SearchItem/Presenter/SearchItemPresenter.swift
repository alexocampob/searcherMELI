//
//  SearchItemPresenter.swift
//  Searcher
//
//  Created by David Alexander Ocampo Barbosa on 14/09/20.
//  Copyright (c) 2020 David Alexander Ocampo Barbosa. All rights reserved.
//
import UIKit

final class SearchItemPresenter: SearchItemPresenterProtocol {
    weak var view: SearchItemViewProtocol?
    var router: SearchItemRouterProtocol?
    var interactor: SearchItemInteractorProtocol?
    var items: [Item]
    var searchingWorkItem: DispatchWorkItem?
    
    init(items: [Item] = [Item]()) {
        self.items = items
    }
    
    func viewDidLoad() {}
    
    func searchItemsBy(query: String) {
        view?.showSearchResult()
        
        //searchingWorkItem?.cancel()
        //searchingWorkItem = DispatchWorkItem { [weak self] in
        self.interactor?.searchItemsBy(query: query)
        //}

        //DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: searchingWorkItem!)
    }
}

extension SearchItemPresenter: SearchItemInteractorOutputProtocol {}
