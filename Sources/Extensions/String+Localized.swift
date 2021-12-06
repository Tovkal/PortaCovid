//
//  String+Localized.swift
//  PortaCovid
//
//  Created by Andrés Pizá Bückmann on 6/12/21.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
