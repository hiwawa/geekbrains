//
//  GroupCellView.swift
//  SwiftUIGeekbrains
//
//  Created by Aleksander Pankow on 21/05/2022.
//

import SwiftUI
import RealmSwift
import Kingfisher

struct GroupCellView: View {
    @ObservedRealmObject var group: GroupModel
    
    var body: some View {
        HStack(spacing:10){
            KFImage(URL(string: group.photo))
                .resizable()
                .frame(width: 60, height: 60, alignment: .trailing)
                .clipShape(Circle())
                .shadow(radius: 5, x: 0.0, y: 5.0)
            Text(group.name)
        }.frame(height: 80)
    }
}
