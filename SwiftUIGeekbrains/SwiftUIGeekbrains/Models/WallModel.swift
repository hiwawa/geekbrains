//
//  WallModel.swift
//  SwiftUIGeekbrains
//
//  Created by Aleksander Pankow on 22/05/2022.
//

import Foundation
import SwiftyJSON
import RealmSwift

@objcMembers class WallModel: Object, ObjectKeyIdentifiable, Codable, Identifiable {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var type: String = ""
    @objc dynamic var text: String = ""
    @objc dynamic var date: Int = 0
    var attachments = List<String>()
    @objc dynamic var coments: Int = 0
    @objc dynamic var likes: Int = 0
    @objc dynamic var reposts: Int = 0
    @objc dynamic var views: Int = 0
    
    
    convenience init(_ json:JSON) {
        
        var i = 0
        var count = json["attachments"].array?.count ?? 0

        self.init()
        self.type = json["type"].stringValue
        self.text = json["text"].stringValue
        self.date = json["date"].intValue
        while i <= count {
            self.attachments.append(json["attachments"][i]["photo"]["sizes"][6]["url"].stringValue)
            i += 1
        }
        self.coments = json["comments"]["count"].intValue
        self.likes = json["likes"]["count"].intValue
        self.reposts = json["reposts"]["count"].intValue
        self.views = json["views"]["count"].intValue
        self.id = json["id"].intValue

    }
    override class func primaryKey() -> String? {
        "id"
    }
}
