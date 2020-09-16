//
//  SearchItemViewController.swift
//  Searcher
//
//  Created by David Alexander Ocampo Barbosa on 14/09/20.
//  Copyright (c) 2020 David Alexander Ocampo Barbosa. All rights reserved.
//

import UIKit

final class SearchItemViewController: UIViewController, Storyboarded {
    
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var serchPlaceholderStackView: UIStackView!
    
    var presenter: SearchItemPresenterProtocol?
    var searchedItems = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SearchItemRouter.createSearchItemModule(with: self)
        loadPresenterViewLoad()
    }
    
    func loadPresenterViewLoad() {
        presenter?.viewDidLoad()
    }
    
    func resetSearchState() {
        hideActivityIndicator()
        resignFirstResponder()
        UIView.animate(withDuration: 0.3) {
            self.tableView.alpha = 0
            self.serchPlaceholderStackView.alpha = 1
        }
    }
    
    func showSearchResult() {
        hideActivityIndicator()
        UIView.animate(withDuration: 0.3) {
            self.tableView.alpha = 1
            self.serchPlaceholderStackView.alpha = 0
        }
    }
}

extension SearchItemViewController: SearchItemViewProtocol {}




