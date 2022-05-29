//
//  DataDetailedView.swift
//  FutureMind.SwiftUI.test
//
//  Created by Aleksander Pankow on 29/05/2022.
//

import SwiftUI
import RealmSwift

struct DataDetailedView: View {
    
    @ObservedRealmObject var data: DataModel
    
    var body: some View {
        WebView(url: URL(string: data.url)!)
        .onAppear{
            print("\(data.id) : \(data.url)")
        }
    }
}
