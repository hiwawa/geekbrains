//
//  MainView.swift
//  SwiftUIGeekbrains
//
//  Created by Aleksander Pankow on 23/01/2022.
//

import SwiftUI

struct AppView: View {
    
    
    
    var body: some View {
        TabView {
            
            ScrollView{
                ProfileView()
            }.edgesIgnoringSafeArea([.top])
            .tabItem {
                Image(systemName: "person.crop.circle")
                Text("Profile")
            }
            
            FriendsView()
            .tabItem {
                Image(systemName: "person.2.fill")
                VStack{
                Text("Friend")
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            
            ScrollView{
                GroupsView()
            }.edgesIgnoringSafeArea([.top])
            .tabItem {
                Image(systemName: "square.grid.2x2")
                Text("Groups")
            }
            
            ScrollView{
                NewsFeedView()
            }.edgesIgnoringSafeArea([.top])
            .tabItem {
                Image(systemName: "book")
                Text("Feed")
            }
        }
        
        
    }
    
}
struct App_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
