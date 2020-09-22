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
    var item: Item
    
    init(item: Item) {
        self.item = item
    }
    
    func viewDidLoad() {
        let productDetail = ProductDetail(thumbnail: item.thumbnail,
                                          title: item.title,
                                          price: "\(Strings.SearchItemScreen.currencyMLA) \(String(item.price))",
                                          condition: getCondition(item.condition),
                                          availableQuantity: String(format: Strings.ProductDetailScreen.availableQuantity,
                                                                    item.availableQuantity.getStringIntValue()),
                                          installmentDescription: String(format: Strings.ProductDetailScreen.installmentsDescription,
                                                                         item.numberInstallments.getStringIntValue(),
                                                                         item.valueInstallment.getStringIntValue()),
                                          shipping: item.freeShipping ? Strings.ProductDetailScreen.freeShipping :
                                            Strings.ProductDetailScreen.payShipping)
        view?.setView(with: productDetail)
    }
    
    private func getCondition(_ condition: String) -> String {
        switch condition {
        case Condition.new.rawValue:
            return Strings.ProductDetailScreen.conditionNew
        default:
            return Strings.ProductDetailScreen.conditionUsed
        }
    }
    
    func onBackTapped() {
        router?.popController()
    }
}

extension ProductDetailPresenter: ProductDetailInteractorOutputProtocol {}
