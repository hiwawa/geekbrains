//
//  DataCellView.swift
//  FutureMind.SwiftUI.test
//
//  Created by Aleksander Pankow on 29/05/2022.
//

import SwiftUI
import RealmSwift
import Kingfisher

struct DataCellView: View {
    
    @ObservedRealmObject var data: DataModel
    
    var body: some View {
        HStack(spacing:10){
            KFImage(URL(string: data.image))
                .resizable()
                .frame(width: 60, height: 60, alignment: .trailing)
                .clipShape(Circle())
                .shadow(radius: 5, x: 0.0, y: 5.0)
            Text(data.title)
            Text(data.modificationDate)
                .font(.footnote)
                .foregroundColor(Color.gray)
            Text(data.details)
        }.frame(height: 80)
    }
}
