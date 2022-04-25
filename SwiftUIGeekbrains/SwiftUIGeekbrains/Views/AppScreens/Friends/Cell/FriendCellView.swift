//
//  FriendCellView.swift
//  SwiftUIGeekbrains
//
//  Created by Aleksander Pankow on 24/01/2022.
//

import SwiftUI

struct FriendCellView: View {
    
    @Binding var firstName: String
    @Binding var lastName: String
    
    var body: some View {
        HStack(spacing:10){
            Image("user-photo-jpg")
                .resizable()
                .frame(width: 60, height: 60, alignment: .trailing)
                .clipShape(Circle())
                .shadow(radius: 5, x: 0.0, y: 5.0)
            Text("\(firstName) \(lastName)")
        }.frame(height: 80)
    }
}
