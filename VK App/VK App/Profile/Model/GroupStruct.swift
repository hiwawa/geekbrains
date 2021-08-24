//
//  GroupStruct.swift
//  VK App
//
//  Created by Aleksander Pankow on 16/10/2020.
//

import Foundation
import SwiftyJSON
import RealmSwift

class GroupList: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var logo: String = ""
    
    convenience init(_ json:JSON)
    {
        self.init()
        self.id = json["id"].intValue
        self.name = json["name"].stringValue
        self.logo = json["photo_200"].stringValue
    }
    override class func primaryKey() -> String? {
        "id"
    }
}

struct GroupModel {
    let id: Int
    let title: String
    let logo: String
}


//struct GroupModel {
//    var id: Int
//    var name: String
//    var logo: String
//
//    init(_ json:JSON) {
//        self.id = json["id"].intValue
//        self.name = json["name"].stringValue
//        self.logo = json["photo_200"].stringValue
//    }
//}
