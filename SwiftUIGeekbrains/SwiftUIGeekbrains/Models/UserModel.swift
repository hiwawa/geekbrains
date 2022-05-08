//
//  UserModel.swift
//  SwiftUIGeekbrains
//
//  Created by Aleksander Pankow on 07/05/2022.
//

import Foundation
import SwiftyJSON
import RealmSwift

@objcMembers class UserModel: Object, ObjectKeyIdentifiable, Codable, Identifiable {
    @objc dynamic var firstname: String = ""
    @objc dynamic var lastname: String = ""
    @objc dynamic var photo: String = ""
    @objc dynamic var nickname: String = ""
    @objc dynamic var domain: String = ""
    @objc dynamic var id: Int = 0
    
    convenience init(_ json:JSON) {

        self.init()
        self.firstname = json["first_name"].stringValue
        self.lastname = json["last_name"].stringValue
        self.photo = json["photo_400_orig"].stringValue
        self.nickname = json["screen_name"].stringValue
        self.domain = json["domain"].stringValue
        self.id = json["id"].intValue

    }
    override class func primaryKey() -> String? {
        "id"
    }
}
