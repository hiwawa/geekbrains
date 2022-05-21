//
//  GroupsView.swift
//  SwiftUIGeekbrains
//
//  Created by Aleksander Pankow on 23/01/2022.
//

import SwiftUI
import RealmSwift
import Kingfisher

struct GroupsView: View {
    
    @ObservedResults(GroupModel.self) var items
    
    var body: some View {
            List {
                ForEach(items){group in
                    NavigationLink(destination: GroupDetailedView(group: group)){
                        GroupCellView(group: group)
                    }
                }
            }
            .navigationBarTitle("Groups")
            .navigationBarBackButtonHidden(true)
            .onAppear(){
                ApiRequest.loadGroups(){
                    groups in try? RealmService.save(items: groups)
                }
            }
    }
}
