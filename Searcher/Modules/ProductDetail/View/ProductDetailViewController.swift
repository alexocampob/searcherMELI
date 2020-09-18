//
//  ProductDetailViewController.swift
//  Searcher
//
//  Created by David Alexander Ocampo Barbosa on 18/09/20.
//  Copyright (c) 2020 David Alexander Ocampo Barbosa. All rights reserved.
//
import UIKit

final class ProductDetailViewController: UIViewController, Storyboarded {
    
    var presenter: ProductDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ProductDetailViewController: ProductDetailViewProtocol {}
