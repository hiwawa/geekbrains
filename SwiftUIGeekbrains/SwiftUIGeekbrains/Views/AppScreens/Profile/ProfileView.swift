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
    
    @EnvironmentObject var settings: UserSettings
    @State private var user = try? Realm().objects(UserModel.self).first
    
    func logoutUser(){
        $settings.unLoged.wrappedValue = true
        $settings.userToken.wrappedValue = nil
        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
        }
    }
    
    var body: some View {
            ZStack(alignment: .bottomLeading) {
                KFImage(URL(string: user?.photo ?? "https://picsum.photos/200"))
                    .resizable()
                    .scaledToFill()
                VStack(alignment: .leading, spacing: 0){
                    Text("\(user?.firstname ?? "Something") \(user?.lastname ?? "Wrong")")
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
                ApiRequest.loadCurrentUser(token: self.settings.userToken as! String){
                    user in try? RealmService.save(items: user)
                }
                print($settings.userToken as Any)
               
            }
    }
}
