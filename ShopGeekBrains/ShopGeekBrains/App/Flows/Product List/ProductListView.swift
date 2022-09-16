//
//  ProductListView.swift
//  ShopGeekBrains
//
//  Created by Aleksander Pankow on 21/07/2022.
//

import SwiftUI

struct ProductListView: View {
    
    @ObservedObject var viewModel = ProductListViewModel()
    
    /*
     We have the viewModel variable with the @ObservedObject modifier, so the view updates every time the @Published variables in the viewModel get updated;
     */
    
    var body: some View {
        NavigationView {
            List(viewModel.products) { product in
                NavigationLink {
                    Text("Product at \(product.title)")
                } label: {
                    Text(product.title)
                }
            }
            .navigationBarTitle(Text("Product List"))
        }
        .onAppear {
            self.viewModel.fetchProducts()
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        var view = ProductListView()
        view.viewModel = ProductListViewModel(dataManager: MockDataManager())
        return view
    }
}
