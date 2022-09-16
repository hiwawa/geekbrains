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
    @ObservedObject var vm = AppViewModel()
    @State private var user = try! Realm().objects(UserModel.self).first
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            KFImage(URL(string: user?.photo ?? "https://picsum.photos/200/300"))
                .resizable()
                .scaledToFill()
                .cornerRadius(10)
            VStack(alignment: .leading, spacing: 0){
                Text("\(user?.firstname ?? "Test") \(user?.lastname ?? "Test")")
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
                    Button(action: {
                        print("Logout")
                        vm.logoutUser()
                    }, label: {
                        NavigationLink(destination: AppStartView()) {
                             Text("Logout")
                         }
                    })
                }
                    
            }
            
        }
        .padding()
        .onAppear{
            ApiRequest.loadUsers(){
                user in try! RealmService.save(items: user)
            }
            ApiRequest.loadWall(){
                wall in try! RealmService.save(items: wall)
            }
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
