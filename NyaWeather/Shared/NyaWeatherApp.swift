//
//  NyaWeatherApp.swift
//  Shared
//
//  Created by Aleksander Pankow on 31/08/2021.
//

import SwiftUI

@main
struct NyaWeatherApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
