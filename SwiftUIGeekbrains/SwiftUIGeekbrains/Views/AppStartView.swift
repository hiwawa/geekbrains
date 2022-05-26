//
//  AppStartView.swift
//  SwiftUIGeekbrains
//
//  Created by Aleksander Pankow on 07/05/2022.
//

import SwiftUI

struct AppStartView: View {
    
    @State var isAuthenticated = AuthManager.IsAuthenticated()
    
    var body: some View {
        Group {
            isAuthenticated ? AnyView(AppView()) : AnyView(LoginVK())
        }.onReceive(AuthManager.Authenticated, perform: {
            isAuthenticated = $0
       })
    }
}
