//
//  NewsFeedView.swift
//  SwiftUIGeekbrains
//
//  Created by Aleksander Pankow on 23/01/2022.
//

import SwiftUI
import RealmSwift

struct NewsFeedView: View {
    
    @ObservedResults(NewsModel.self, filter: NSPredicate(format: "type = 'post'")) var items
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false){
                VStack(spacing:20){
                    ForEach(items){news in
                        NewsCellView(news: news)
                    }
                }
            }
            .padding(.horizontal)
            .navigationTitle("News Feed")
            .onAppear(){
                ApiRequest.loadNewsFeed(){
                    news in try? RealmService.save(items: news)
                }
            }
        }
    }
}
