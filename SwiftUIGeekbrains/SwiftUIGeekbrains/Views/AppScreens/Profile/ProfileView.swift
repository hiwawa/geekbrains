//
//  ProfileView.swift
//  SwiftUIGeekbrains
//
//  Created by Aleksander Pankow on 23/01/2022.
//

import SwiftUI
import RealmSwift
import Kingfisher

struct ProfileView: View {
    
    @ObservedResults(WallModel.self) var items
    @State private var user = try! Realm().objects(UserModel.self).first
    
    func logoutUser(){
        UserDefaults.standard.removeObject(forKey: "vkToken")
        print("Logout")
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            KFImage(URL(string: user!.photo))
                .resizable()
                .scaledToFill()
            VStack(alignment: .leading, spacing: 0){
                Text("\(user!.firstname) \(user!.lastname)")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding([.leading])
                HStack{
                    Text("30 лет")
                        .foregroundColor(Color.white)
                        .padding([.leading, .bottom], 15)
                        .padding(.top, 5)
                        .font(.caption)
                }
                HStack{
                    NavigationLink(destination: AppStartView(), label: {
                        Button(action: logoutUser, label: {
                            Text("Logout")
                        })
                    })
                }
            }
            
        }.onAppear(){
            ApiRequest.loadUsers(){
                user in try? RealmService.save(items: user)
            }
            ApiRequest.loadWall(){
                wall in try? RealmService.save(items: wall)
            }
            print(items)
        }
        VStack{
            HStack{
                ScrollView(.vertical, showsIndicators: false){
                    VStack(spacing:20){
                        ForEach(items){wall in
                            WallCellView(wall: wall)
                        }
                    }
                }
            }
            .padding([.top, .leading, .trailing])
        }
    }
}
