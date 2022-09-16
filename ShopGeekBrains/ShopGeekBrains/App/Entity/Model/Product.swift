//
//  Product.swift
//  ShopGeekBrains
//
//  Created by Aleksander Pankow on 21/07/2022.
//

import Foundation

struct Product: Identifiable {
    var id = UUID()
    var title: String
    var isInactive = false
}
