//
//  FriendProfileView.swift
//  SwiftUIGeekbrains
//
//  Created by Aleksander Pankow on 24/01/2022.
//

import SwiftUI
import RealmSwift
import Kingfisher

struct FriendDetailedView: View {
    
    @ObservedRealmObject var friend: FriendModel
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                KFImage(URL(string: friend.photo))
                    .resizable()
                    .frame(width: .infinity, height: 200)
                    .cornerRadius(10)
                
                Text(friend.firstname)
                    .font(.title)
                    .bold()
                    .padding(.bottom, 1.0)
            }.padding()
        }
    }
}
