//
//  FriendsView.swift
//  SwiftUIGeekbrains
//
//  Created by Aleksander Pankow on 23/01/2022.
//

import SwiftUI

struct FriendsView: View {
    
    @State private var friendList: [Friend] =
    [
        Friend(id: 1, firstName: "Ivan", lastName: "Ivanov", online: true),
        Friend(id: 2, firstName: "Natalia", lastName: "Poklonskaya", online: false),
        Friend(id: 3, firstName: "Vladimir", lastName: "Putin", online: true)
    ]
    
    var body: some View {
        NavigationView{
            List {
                ForEach($friendList){friend in
                    NavigationLink(destination: FriendProfileView(firstName: friend.firstName)){
                    FriendCellView(
                        firstName: friend.firstName,
                        lastName: friend.lastName)
                        
                    }
                }
            }
            .navigationBarTitle("Friends")
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}
