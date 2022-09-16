//
//  AuthManager.swift
//  SwiftUIGeekbrains
//
//  Created by Aleksander Pankow on 26/05/2022.
//

import Foundation
import Combine

struct AuthManager {
    static let Authenticated = PassthroughSubject<Bool, Never>()
    static func IsAuthenticated() -> Bool {
        return UserDefaults.standard.string(forKey: "vkToken") != nil
    }
}
