//
//  GroupStruct.swift
//  VK App
//
//  Created by Aleksander Pankow on 16/10/2020.
//

import Foundation
import SwiftyJSON

struct GroupModel {
    var id: Int
    var name: String
    
    
    init(_ json:JSON) {
        self.id = json["id"].intValue
        self.name = json["name"].stringValue
    }
}

struct ShortGroupModel {
    var id: Int
    var name: String
    var logo: String
    
    init(_ json:JSON) {
        self.id = json["id"].intValue
        self.name = json["name"].stringValue
        self.logo = json["photo_100"].stringValue
    }
}
