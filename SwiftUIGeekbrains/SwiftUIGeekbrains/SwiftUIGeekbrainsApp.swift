//
//  SwiftUIGeekbrainsApp.swift
//  SwiftUIGeekbrains
//
//  Created by Aleksander Pankow on 04/10/2021.
//
import UIKit
import SwiftUI

@main
struct SwiftUIGeekbrainsApp: App {
    
    var body: some Scene {
        WindowGroup {
            AppStartView()
            .environmentObject(UserSettings())
        }
    }
}
