//
//  GroupsView.swift
//  SwiftUIGeekbrains
//
//  Created by Aleksander Pankow on 23/01/2022.
//

import SwiftUI
import RealmSwift

struct GroupsView: View {
    
    @ObservedResults(GroupModel.self) var items
    
    var body: some View {
        NavigationView{
            List {
                ForEach(items){group in
                    NavigationLink(destination: GroupDetailedView(group: group)){
                        GroupCellView(group: group)
                    }
                }
            }
            .navigationTitle("Groups")
            .onAppear(){
                ApiRequest.loadGroups(){
                    groups in try? RealmService.save(items: groups)
                }
            }
        }
    }
}
