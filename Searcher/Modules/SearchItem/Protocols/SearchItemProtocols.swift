//
//  SearchItemProtocols.swift
//  Searcher
//
//  Created by David Alexander Ocampo Barbosa on 14/09/20.
//  Copyright (c) 2020 David Alexander Ocampo Barbosa. All rights reserved.
//

import UIKit

protocol SearchItemInteractorProtocol: AnyObject {
    var presenter: SearchItemInteractorOutputProtocol? { get set }
    var networkingItemsAdapter: NetworkingItemsAdapterProtocol { get set }
    func searchItemsBy(query: String)
}

protocol SearchItemPresenterProtocol: AnyObject {
    var view: SearchItemViewProtocol? { get set }
    var router: SearchItemRouterProtocol? { get set }
    var interactor: SearchItemInteractorProtocol? { get set }
    var items: [Item] { get set }
    
    func searchItemsBy(query: String)
    func showProductDetail(with item: Item)
}

protocol SearchItemInteractorOutputProtocol: AnyObject {
    func onSearchItemSuccess(with items: [Item])
    func onSearchItemFailed(with error: Error)
}

protocol SearchItemRouterProtocol: AnyObject {
    var viewController: UIViewController? { get set }
    
    static func createSearchItemModule() -> UIViewController
    func showErrorAlert()
    func showProductDetail(with item: Item)
}

protocol SearchItemViewProtocol: AnyObject {
    var presenter: SearchItemPresenterProtocol? { get set }
    func showSearchResult(with items: [Item])
    func resetSearchState()
    func clearSearchedItems()
    func showEmptySearchMessage()
}
