//
//  GroupDetailedView.swift
//  SwiftUIGeekbrains
//
//  Created by Aleksander Pankow on 21/05/2022.
//

import SwiftUI
import RealmSwift
import Kingfisher

struct GroupDetailedView: View {
    
    @ObservedRealmObject var group: GroupModel
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                KFImage(URL(string: group.photo))
                    .resizable()
                    .frame(width: .infinity, height: 200)
                    .cornerRadius(10)
                
                Text(group.name)
                    .font(.title)
                    .bold()
                    .padding(.bottom, 1.0)
            }.padding()
        }
    }
}
