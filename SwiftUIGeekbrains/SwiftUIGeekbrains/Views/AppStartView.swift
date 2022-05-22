//
//  AppStartView.swift
//  SwiftUIGeekbrains
//
//  Created by Aleksander Pankow on 07/05/2022.
//

import SwiftUI

struct AppStartView: View {
    
    @AppStorage("vkToken") private var isLogin: Bool = false
    
    var body: some View {
        Group {
            isLogin ?
            AnyView(LoginVK()) :
            AnyView(AppView())
        }
        //        NavigationView{
        //            AppView()
        //                .sheet(isPresented: $settings.unLoged, content: {   LoginVK()   })
        //        }
    }
}
