//
//  SearchItemInteractor.swift
//  Searcher
//
//  Created by David Alexander Ocampo Barbosa on 14/09/20.
//  Copyright (c) 2020 David Alexander Ocampo Barbosa. All rights reserved.
//

final class SearchItemInteractor: SearchItemInteractorProtocol {
    weak var presenter: SearchItemInteractorOutputProtocol?
    var networkingItemsAdapter: NetworkingItemsAdapterProtocol?
    
    init(networkingItemsAdapter: NetworkingItemsAdapterProtocol = NetworkingItemsAdapter()) {
        self.networkingItemsAdapter = networkingItemsAdapter
    }
    
    func searchItemsBy(query: String) {
        networkingItemsAdapter?.getItemsBy(query: query) { [weak self] (response) in
            switch response {
            case .success(let itemsResponse):
                let items: [Item] = itemsResponse.results.map { itemResponse in
                    let item = Item(thumbnail: itemResponse.thumbnail,
                                    title: itemResponse.title,
                                    price: itemResponse.price,
                                    condition: itemResponse.condition.rawValue,
                                    availableQuantity: itemResponse.availableQuantity,
                                    numberInstallments: itemResponse.installments.quantity,
                                    valueInstallment: itemResponse.installments.amount,
                                    freeShipping: itemResponse.shipping.freeShipping)
                    return item
                }
                self?.presenter?.onSearchItemSuccess(with: items)
            case .failure(let error):
                self?.presenter?.onSearchItemFailed(with: error)
            }
        }
    }
}
