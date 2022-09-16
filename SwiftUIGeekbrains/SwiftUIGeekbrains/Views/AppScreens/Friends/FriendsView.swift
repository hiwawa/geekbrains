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
        NavigationView{
            List {
                ForEach(items){friend in
                    NavigationLink(destination: FriendDetailedView(friend: friend)){
                        FriendCellView(friend: friend)
                    }
                }
            }
            .navigationTitle("Friends")
            .onAppear(){
                ApiRequest.loadFriends(){
                    friends in try? RealmService.save(items: friends)
                }
            }
        }
        
    }
}
