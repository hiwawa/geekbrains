//
//  ContentView.swift
//  FutureMind.SwiftUI.test
//
//  Created by Aleksander Pankow on 29/05/2022.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    
    @ObservedResults(DataModel.self) var items
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Button("Update") {
                        ApiRequest.loadData(){
                            data in try? RealmService.save(items: data)
                        }
                    }
                }
                HStack{
                    List {
                        ForEach(items){data in
                            NavigationLink(destination: DataDetailedView(data: data))
                            {
                                DataCellView(data: data)
                            }
                        }
                    }
                    .onAppear(){
                        ApiRequest.loadData(){
                            data in try? RealmService.save(items: data)
                        }
                    }
                }
            }
            .navigationTitle("Data")
        }
    }
}
