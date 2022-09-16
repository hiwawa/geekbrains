//
//  FriendCellView.swift
//  SwiftUIGeekbrains
//
//  Created by Aleksander Pankow on 24/01/2022.
//

import SwiftUI
import RealmSwift
import Kingfisher

struct FriendCellView: View {
    
    @ObservedRealmObject var friend: FriendModel
    
    var body: some View {
        HStack(spacing:10){
            KFImage(URL(string: friend.photo))
                .resizable()
                .frame(width: 60, height: 60, alignment: .trailing)
                .clipShape(Circle())
                .shadow(radius: 5, x: 0.0, y: 5.0)
            Text(friend.firstname)
        }.frame(height: 80)
    }
}
