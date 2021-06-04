//
//  PhotoStruct.swift
//  VK App
//
//  Created by Aleksander Pankow on 11/05/2021.
//

import Foundation
import RealmSwift
import SwiftyJSON

class PhotoList: Object {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var url: String = ""
    
    convenience init(_ json:JSON)
    {
        self.init()
        self.id = json["id"].intValue
        self.url = json["sizes"][7]["url"].stringValue
    }
    
    override class func primaryKey() -> String? {
        "id"
    }
    
}
