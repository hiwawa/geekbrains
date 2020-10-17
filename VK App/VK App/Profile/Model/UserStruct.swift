//
//  UserStruct.swift
//  VK App
//
//  Created by Aleksander Pankow on 13/10/2020.
//

import Foundation

class UserModel {
    let username: String
    let password: String
    let firstname: String
    let lastname: String
    let phone: String
    let dateofbirth: String
    let email: String
    
    init(username: String, password: String, firstname: String, lastname: String, phone: String, dateofbirth: String, email: String) {
        
        self.username = username
        self.password = password
        self.firstname = firstname
        self.lastname = lastname
        self.phone = phone
        self.dateofbirth = dateofbirth
        self.email = email
    }
}
