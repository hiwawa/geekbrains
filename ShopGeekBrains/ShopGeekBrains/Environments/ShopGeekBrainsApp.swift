//
//  ShopGeekBrainsApp.swift
//  ShopGeekBrains
//
//  Created by Aleksander Pankow on 21/07/2022.
//

import SwiftUI

@main
struct ShopGeekBrainsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
