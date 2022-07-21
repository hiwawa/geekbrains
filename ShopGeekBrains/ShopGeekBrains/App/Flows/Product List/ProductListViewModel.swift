//
//  ProductListViewModel.swift
//  ShopGeekBrains
//
//  Created by Aleksander Pankow on 21/07/2022.
//

import Foundation
import Combine

protocol ProductListViewModelProtocol {
    var products: [Product] { get }
    var showInactive: Bool { get set }
    func fetchProducts()
//    func addProduct(title: String)
    func toggleIsInactive(for product: Product)
}

final class ProductListViewModel: ObservableObject {
    @Published var products = [Product]()
    @Published var showInactive = false {
        didSet {
            fetchProducts()
        }
    }
    
    var dataManager: DataManagerProtocol
    
    init(dataManager: DataManagerProtocol = DataManager.shared) {
        self.dataManager = dataManager
        fetchProducts()
    }
}

// MARK: - ProductListViewModelProtocol
extension ProductListViewModel: ProductListViewModelProtocol {
    func fetchProducts() {
        products = dataManager.fetchProductList(includingInactive: showInactive)
    }
    
    func toggleIsInactive(for product: Product) {
        dataManager.toggleIsInactive(for: product)
        fetchProducts()
    }
}

/*
 
 We add conformance to the ObservableObject so we can observe the changes in the viewModel;

 We have todos and showCompleted with the @Published modifier because we need our view to be updated on any change of these variables;

 Our viewModel needs to use DataManager so we create a variable for that. The type of the variable is DataManagerProtocol because viewModel should not know anything about DataManager. It is very helpful when we test the viewModel, we just can create some MockDataManager that will conform to the protocol and initialize and test the viewModel without touching our real Data Manager (even though the Data Manager we created does not seem to be real, but let’s just pretend it is real for now);
 
 We create an extension for the viewModel that conforms to the protocol we made and implement all the methods there (except for todos and showCompleted, because we cannot put variables into an extension).
 
*/
