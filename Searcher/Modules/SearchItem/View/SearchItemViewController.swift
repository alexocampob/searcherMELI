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
    @IBOutlet weak var descriptiveLabel: UILabel!
    
    var presenter: SearchItemPresenterProtocol?
    var searchedItems = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        tableView.register(UINib(nibName: String(describing: SearchItemCell.self),
                                 bundle: .main),
                           forCellReuseIdentifier: String(describing: SearchItemCell.self))
    }
    
    private func showTableView() {
        hideActivityIndicator()
        UIView.animate(withDuration: 0.3) {
            self.tableView.alpha = 1
            self.serchPlaceholderStackView.alpha = 0
        }
    }
}

extension SearchItemViewController: SearchItemViewProtocol {
    func resetSearchState() {
        descriptiveLabel.text = Strings.SearchItemScreen.defaultSearchText
        hideActivityIndicator()
        resignFirstResponder()
        searchBar.text = String()
        UIView.animate(withDuration: 0.3) {
            self.tableView.alpha = 0
            self.serchPlaceholderStackView.alpha = 1
        }
    }
    
    func clearSearchedItems() {
        searchedItems.removeAll()
        tableView.reloadData()
    }
    
    func showSearchResult(with items: [Item]) {
        self.searchedItems = items
        showTableView()
        self.tableView.reloadData()
    }
    
    func showEmptySearchMessage() {
        descriptiveLabel.text = Strings.SearchItemScreen.emptySearchText
    }
}




