//
//  AppStartView.swift
//  SwiftUIGeekbrains
//
//  Created by Aleksander Pankow on 07/05/2022.
//

import SwiftUI

class UserSettings: ObservableObject {
    @Published var userToken = UserDefaults.standard.object(forKey: "vkToken")
    @Published var unLoged : Bool = false
}

struct AppStartView: View {
    
    @EnvironmentObject var settings: UserSettings
    
    func loginCheck(){
        if settings.userToken == nil {
            settings.unLoged = true
            print("Login Popup \(settings.unLoged)")
        } else {
            print("Login Popup \(settings.unLoged)")
        }
    }
    
    var body: some View {
        NavigationView{
            AppView()
                .sheet(isPresented: $settings.unLoged, content: {   LoginVK()   })
                .onAppear(){
                    loginCheck()
                }
        }
    }
}
