//
//  AppViewModel.swift
//  SwiftUIGeekbrains
//
//  Created by Aleksander Pankow on 26/05/2022.
//

import Foundation
import Combine
import RealmSwift

class AppViewModel: ObservableObject {
    func logoutUser() {
        UserDefaults.standard.removeObject(forKey: "vkToken")
        AuthManager.Authenticated.send(false)
        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
        }
    }
}
