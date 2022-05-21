//
//  FriendsView.swift
//  SwiftUIGeekbrains
//
//  Created by Aleksander Pankow on 23/01/2022.
//

import SwiftUI
import RealmSwift
import Kingfisher

struct FriendsView: View {
    
    @ObservedResults(FriendModel.self) var items
    
    var body: some View {
            List {
                ForEach(items){friend in
                    NavigationLink(destination: FriendDetailedView(friend: friend)){
                        FriendCellView(friend: friend)
                    }
                }
            }
            .navigationBarTitle("Friends")
            .navigationBarBackButtonHidden(true)
            .onAppear(){
                ApiRequest.loadFriends(){
                    friends in try? RealmService.save(items: friends)
                }
            }
    }
}
