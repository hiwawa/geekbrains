//
//  FriendsStruct.swift
//  VK App
//
//  Created by Aleksander Pankow on 02/02/2021.
//

import Foundation
import RealmSwift
import SwiftyJSON

class FriendList: Object {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var firstname: String = ""
    @objc dynamic var lastname: String = ""
    @objc dynamic var photo: String = ""
    @objc dynamic var online: Int = 0
    
    convenience init(_ json:JSON)
    {
        self.init()
        self.id = json["id"].intValue
        self.firstname = json["first_name"].stringValue
        self.lastname = json["last_name"].stringValue
        self.photo = json["photo_200"].stringValue
        self.online = json["online"].intValue
    }
    
    override class func primaryKey() -> String? {
        "id"
    }
    
}
