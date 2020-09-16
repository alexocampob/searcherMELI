//
//  SearchItemInteractor.swift
//  Searcher
//
//  Created by David Alexander Ocampo Barbosa on 14/09/20.
//  Copyright (c) 2020 David Alexander Ocampo Barbosa. All rights reserved.
//

final class SearchItemInteractor: SearchItemInteractorProtocol {
    weak var presenter: SearchItemInteractorOutputProtocol?
    var networkingItemsAdapter: NetworkingItemsAdapterProtocol
    
    init(networkingItemsAdapter: NetworkingItemsAdapterProtocol = NetworkingItemsAdapter()) {
        self.networkingItemsAdapter = networkingItemsAdapter
    }
    
    func searchItemsBy(query: String) {
        networkingItemsAdapter.getItemsBy(query: query) { (response) in
            switch response {
            case .success(let itemsResponse):
                let items: [Item] = itemsResponse.results.map { itemResponse in
                    let item = Item(thumbnail: itemResponse.thumbnail,
                                    title: itemResponse.title,
                                    price: itemResponse.price)
                    return item
                }
                //TODO presenter call
                break
            case .failure(let error):
                break
            }
        }
    }
       
}
