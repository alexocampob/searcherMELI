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
    
    func searchItemsBy(query: String) {
        searchingWorkItem?.cancel()
        if query.isEmpty {
            view?.resetSearchState()
        } else {
            searchingWorkItem = DispatchWorkItem { [weak self] in
                self?.interactor?.searchItemsBy(query: query)
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: searchingWorkItem!)
    }
    
    func showProductDetail(with item: Item) {
        router?.showProductDetail(with: item)
    }
}

extension SearchItemPresenter: SearchItemInteractorOutputProtocol {
    func onSearchItemFailed(with error: Error) {
        router?.showErrorAlert()
        view?.resetSearchState()
    }
    
    func onSearchItemSuccess(with items: [Item]) {
        if items.isEmpty {
            view?.showEmptySearchMessage()
        } else {
            view?.clearSearchedItems()
            view?.showSearchResult(with: items)
        }
    }
}
