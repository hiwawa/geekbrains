//
//  MockDataManager.swift
//  ShopGeekBrains
//
//  Created by Aleksander Pankow on 21/07/2022.
//

import Foundation

class MockDataManager {
    private var products = [Product]()
    
    init() {
        products = [
            Product(id: UUID(), title: "Morning workout", isInactive: false),
            Product(id: UUID(), title: "Sign documents", isInactive: false),
            Product(id: UUID(), title: "Check email", isInactive: true),
            Product(id: UUID(), title: "Call boss", isInactive: false),
            Product(id: UUID(), title: "Buy groceries", isInactive: false),
            Product(id: UUID(), title: "Finish article", isInactive: true),
            Product(id: UUID(), title: "Pay bills", isInactive: true)
        ]
    }
    
}

// MARK: - DataManagerProtocol
extension MockDataManager: DataManagerProtocol {
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
