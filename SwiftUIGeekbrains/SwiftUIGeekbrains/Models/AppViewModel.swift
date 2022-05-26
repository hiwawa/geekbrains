//
//  AppViewModel.swift
//  SwiftUIGeekbrains
//
//  Created by Aleksander Pankow on 26/05/2022.
//

import Foundation
import Combine

class AppViewModel: ObservableObject {
    func logoutUser() {
        UserDefaults.standard.removeObject(forKey: "vkToken")
        AuthManager.Authenticated.send(false)
    }
}
