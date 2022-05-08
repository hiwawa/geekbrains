//
//  AppStartView.swift
//  SwiftUIGeekbrains
//
//  Created by Aleksander Pankow on 07/05/2022.
//

import SwiftUI

class UserSettings: ObservableObject {
    @Published var loggedIn : Bool = false
    @Published var userToken = UserDefaults.standard.object(forKey: "vkToken")
}

struct AppStartView: View {
    
    @State private var isLogout: Bool = false
    @State private var isLoginView: Bool = false
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
        if (settings.userToken != nil) {
            return AnyView(AppView())
        } else {
            return AnyView(LoginVK())
        }
    }
}
