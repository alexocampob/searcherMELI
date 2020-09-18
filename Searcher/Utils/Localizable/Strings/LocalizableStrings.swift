//
//  LocalizableStrings.swift
//  Searcher
//
//  Created by David Alexander Ocampo Barbosa on 17/09/20.
//  Copyright © 2020 David Alexander Ocampo Barbosa. All rights reserved.
//

import Foundation

extension String {
    var localizable: String {
        return NSLocalizedString(self, comment: "STRINGS TEXT")
    }
}

struct Strings {
    struct SearchItemAlert {
        static var title: String { return "searchItemAlert.alertTitle".localizable }
        static var titleButtonOk: String { return "searchItemAlert.alertButtonOk".localizable }
    }
    
    struct SearchItemScreen {
        static var defaultSearchText: String { return "searchItemScreen.defaultSearchText".localizable }
        static var emptySearchText: String { return "searchItemScreen.emptySearchText".localizable }
        static var currencyMLA: String { return "searchItemScreen.currencyMLA".localizable }
    }
}
