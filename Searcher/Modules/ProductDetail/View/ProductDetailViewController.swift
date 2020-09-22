//
//  ProductDetailViewController.swift
//  Searcher
//
//  Created by David Alexander Ocampo Barbosa on 18/09/20.
//  Copyright (c) 2020 David Alexander Ocampo Barbosa. All rights reserved.
//
import UIKit

final class ProductDetailViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var availableQuantityLabel: UILabel!
    @IBOutlet weak var installmentsLabel: UILabel!
    @IBOutlet weak var shippmentLabel: UILabel!
    
    var presenter: ProductDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    @IBAction func onBackTapped(_ sender: Any) {
        presenter?.onBackTapped()
    }
}

extension ProductDetailViewController: ProductDetailViewProtocol {
    func setView(with productDetail: ProductDetail) {
        photoImageView.downloaded(from: productDetail.thumbnail)
        titleLabel.text = productDetail.title
        conditionLabel.text = productDetail.condition
        priceLabel.text = productDetail.price
        availableQuantityLabel.text = productDetail.availableQuantity
        installmentsLabel.text = productDetail.installmentDescription
        shippmentLabel.text = productDetail.shipping
    }
}
