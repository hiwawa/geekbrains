//
//  GroupModel.swift
//  SwiftUIGeekbrains
//
//  Created by Aleksander Pankow on 21/05/2022.
//

import Foundation
import SwiftyJSON
import RealmSwift

@objcMembers class GroupModel: Object, ObjectKeyIdentifiable, Codable, Identifiable {
    @objc dynamic var name: String = ""
    @objc dynamic var photo: String = ""
    @objc dynamic var id: Int = 0
    
    convenience init(_ json:JSON) {

        self.init()
        self.name = json["name"].stringValue
        self.photo = json["photo_200"].stringValue
        self.id = json["id"].intValue

    }
    override class func primaryKey() -> String? {
        "id"
    }
}
