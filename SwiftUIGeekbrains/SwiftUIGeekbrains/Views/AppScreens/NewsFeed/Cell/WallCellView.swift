//
//  WallCellView.swift
//  SwiftUIGeekbrains
//
//  Created by Aleksander Pankow on 22/05/2022.
//

import SwiftUI
import RealmSwift
import Kingfisher

struct WallCellView: View {
    
    @ObservedRealmObject var wall: WallModel
    @State  var isLike: Bool = false
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 5) {
                ScrollView(.horizontal){
                    HStack{
                        ForEach(wall.attachments, id: \.self) {
                            item in
                            VStack{
                                KFImage(URL(string: item))
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: UIScreen.main.bounds.width - 150, height: UIScreen.main.bounds.width - 180)
                                    .clipped()
                            }
                        }
                    }
                }.padding(20)
                VStack(alignment: .leading) {
                    Text(wall.text)
                        .font(.subheadline)
                        .foregroundColor(Color.white)
                    
                }
                .padding(.horizontal)
                VStack(alignment: .leading){
                    HStack(alignment: .center, spacing: 10.0){
                        Button(action: {
                            print("Like! \(wall.id)")
                            self.isLike.toggle()
                        }) {
                            Image(systemName: self.isLike == true ? "heart.fill" : "heart")
                                .renderingMode(.original)
                                .foregroundColor(Color("yellow-app-color"))
                            Text("\(wall.likes)")
                                .font(.footnote)
                                .foregroundColor(Color.gray)
                        }
                        
                        Button(action: {
                            print("Comment!")
                            
                        }) {
                            Image(systemName: "bubble.right")
                                .renderingMode(.original)
                                .foregroundColor(Color("yellow-app-color"))
                            Text("\(wall.coments)")
                                .font(.footnote)
                                .foregroundColor(Color.gray)
                        }
                        
                        Button(action: {
                            print("Repost!")
                            
                        }) {
                            Image(systemName: "arrowshape.turn.up.right")
                                .renderingMode(.original)
                                .foregroundColor(Color("yellow-app-color"))
                            Text("\(wall.reposts)")
                                .font(.footnote)
                                .foregroundColor(Color.gray)
                        }
                        
                        Button(action: {
                            print("Views!")
                            
                        }) {
                            Image(systemName: "eye")
                                .renderingMode(.original)
                                .foregroundColor(Color("yellow-app-color"))
                            Text("\(wall.views)")
                                .font(.footnote)
                                .foregroundColor(Color.gray)
                        }
                    }
                    .padding([.top, .leading, .trailing])
                }
            }
            .padding(.bottom)
            .background(Color("bg-card-color"))
            .cornerRadius(10)
        }
    }
}
