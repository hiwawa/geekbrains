//
//  MainWallStruct.swift
//  VK App
//
//  Created by Aleksander Pankow on 31/05/2021.
//

import Foundation
import RealmSwift
import SwiftyJSON

class MainWall: Object {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var text: String = ""
    @objc dynamic var photo: String = ""
    
    convenience init(_ json:JSON)
    {
        self.init()
        self.id = json["owner_id"].intValue
        self.text = json["text"].stringValue
        self.photo = json["attachments"][0]["photo"]["sizes"][5]["url"].stringValue
        
    }
    
    override class func primaryKey() -> String? {
        "id"
    }
    
}
