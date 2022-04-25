//
//  ProfileView.swift
//  SwiftUIGeekbrains
//
//  Created by Aleksander Pankow on 23/01/2022.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var status: String = "Онлайн"
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image("user-photo-jpg")
                .resizable()
                .scaledToFill()
            VStack(alignment: .leading, spacing: 0){
                Text("Aleksander Pankow")
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

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
