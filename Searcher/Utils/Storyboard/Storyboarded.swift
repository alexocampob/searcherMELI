//
//  Storyboarded.swift
//  Searcher
//
//  Created by David Alexander Ocampo Barbosa on 14/09/20.
//  Copyright © 2020 David Alexander Ocampo Barbosa. All rights reserved.
//

import UIKit

protocol Storyboarded {
    static func instantiate(from storyboard: Storyboards) -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate(from storyboard: Storyboards) -> Self {
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
