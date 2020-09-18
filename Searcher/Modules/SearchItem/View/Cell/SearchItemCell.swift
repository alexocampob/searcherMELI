//
//  SearchItemCell.swift
//  Searcher
//
//  Created by David Alexander Ocampo Barbosa on 17/09/20.
//  Copyright © 2020 David Alexander Ocampo Barbosa. All rights reserved.
//

import UIKit

class SearchItemCell: UITableViewCell {
    
    @IBOutlet private weak var itemImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    private var item: Item?
    var onTapped: ((Item) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let gesture = UITapGestureRecognizer(target: self,
                                             action: #selector(onCellTapped))
        self.contentView.addGestureRecognizer(gesture)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        itemImageView.image = nil
        itemImageView.backgroundColor = .lightGray
    }
    
    func setupCell(with item: Item) {
        self.item = item
        titleLabel.text = item.title
        priceLabel.text = "\(Strings.SearchItemScreen.currencyMLA) \(item.price)"
        itemImageView.downloaded(from: item.thumbnail)
    }
    
    @objc func onCellTapped() {
        guard let item = item else { return }
        onTapped?(item)
    }
}
