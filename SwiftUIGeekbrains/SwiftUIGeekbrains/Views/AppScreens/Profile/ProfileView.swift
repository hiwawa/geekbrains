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
    
    @State private var status: String = "Онлайн"
    @State private var user = try? Realm().objects(UserModel.self)
    
    var userObject = try? Realm()
        .objects(UserModel.self).first
    
    var body: some View {
        
        ZStack(alignment: .bottomLeading) {
            KFImage(URL(string: userObject!.photo))
                .resizable()
                .scaledToFill()
            VStack(alignment: .leading, spacing: 0){
                Text("\(userObject!.firstname) \(userObject!.lastname)")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding([.leading])
                HStack{
                    Text("29 лет")
                        .foregroundColor(Color.white)
                        .padding([.leading, .bottom], 15)
                        .padding(.top, 5)
                        .font(.caption)
                    Text(status)
                        .foregroundColor(onlineColor())
                        .font(.caption2)
                        .padding(.bottom, 10)
                }
                
            }
            
            
        }.onAppear(){
            ApiRequest.loadCurrentUser(token: self.settings.userToken as! String){
                user in try? RealmService.save(items: user)
            }
        }
        
    }
    private func onlineColor() -> Color{
        if status == "Онлайн" {
            return Color.green
        } else {
            return Color.red
        }
    }
}

//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView()
//    }
//}
