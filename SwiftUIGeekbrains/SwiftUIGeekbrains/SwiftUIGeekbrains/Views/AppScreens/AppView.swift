//
//  MainView.swift
//  SwiftUIGeekbrains
//
//  Created by Aleksander Pankow on 23/01/2022.
//

import SwiftUI

struct MainView: View {
    
    
    
    var body: some View {
        TabView {
            ScrollView{
                ProfileView()
            }.edgesIgnoringSafeArea([.top])
            .tabItem {
                Image(systemName: "person.crop.circle")
                Text("Profile")
            }
            ScrollView{
                HStack{
                    Text("Friends")
                }
            }.edgesIgnoringSafeArea([.top])
            .tabItem {
                Image(systemName: "person.2.fill")
                VStack{
                Text("Friend")
                }
            }
            ScrollView{
                Text("Groups")
            }.edgesIgnoringSafeArea([.top])
            .tabItem {
                Image(systemName: "square.grid.2x2")
                Text("Groups")
            }
            ScrollView{
                Text("News")
            }.edgesIgnoringSafeArea([.top])
            .tabItem {
                Image(systemName: "book")
                Text("Feed")
            }
        }
        
        
    }
    
}
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
