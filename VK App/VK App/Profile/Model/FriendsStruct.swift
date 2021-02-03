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
        self.id = id
        self.firstname = firstname
        self.lastname = lastname
        self.photo = photo
        self.online = online
    }
    
}
