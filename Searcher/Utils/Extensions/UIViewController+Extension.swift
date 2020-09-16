//
//  UIViewController+Extension.swift
//  Searcher
//
//  Created by David Alexander Ocampo Barbosa on 15/09/20.
//  Copyright © 2020 David Alexander Ocampo Barbosa. All rights reserved.
//

import UIKit

fileprivate var activityIndicatorView: UIView?

extension UIViewController {
    
    func showActivityIndicator(on view: UIView) {
        activityIndicatorView = UIView(frame: view.frame)
        activityIndicatorView?.backgroundColor = .clear
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.center = view.center
        activityIndicator.startAnimating()
        self.view.addSubview(activityIndicatorView ?? UIView())
    }
    
    func hideActivityIndicator() {
        activityIndicatorView?.removeFromSuperview()
        activityIndicatorView = nil
    }
}
