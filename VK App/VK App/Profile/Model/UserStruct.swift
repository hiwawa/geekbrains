//
//  UserStruct.swift
//  VK App
//
//  Created by Aleksander Pankow on 13/10/2020.
//

import Foundation
import SwiftyJSON


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

class ShortUserModel {
    let firstname: String
    let lastname: String
    let photo: String
    let online: Int
    let id: Int
    
    init(_ json:JSON) {
        
        self.firstname = json["first_name"].stringValue
        self.lastname = json["last_name"].stringValue
        self.photo = json["photo_50"].stringValue
        self.online = json["online"].intValue
        self.id = json["id"].intValue

    }
}
