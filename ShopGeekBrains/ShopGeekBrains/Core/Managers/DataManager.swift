//
//  DataManager.swift
//  ShopGeekBrains
//
//  Created by Aleksander Pankow on 21/07/2022.
//

import Foundation

protocol DataManagerProtocol {
    func fetchProductList(includingInactive: Bool) -> [Product]
    func addProduct(title: String)
    func toggleIsInactive(for product: Product)
}

extension DataManagerProtocol {
    func fetchProductList(includingInactive: Bool = false) -> [Product] {
        fetchProductList(includingInactive: includingInactive)
    }
}

class DataManager {
    static let shared: DataManagerProtocol = DataManager()
    
    private var products = [Product]()
    
    private init() { } //private for remove posibility  to create orher DataManager objects
}

// MARK: - DataManagerProtocol
extension DataManager: DataManagerProtocol {
    
    func fetchProductList(includingInactive: Bool = false) -> [Product] {
        includingInactive ? products : products.filter { !$0.isInactive }
    }
    
    func addProduct(title: String) {
        let product = Product(title: title)
        products.insert(product, at: 0)
    }
    
    func toggleIsInactive(for product: Product) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            products[index].isInactive.toggle()
        }
    }
}
