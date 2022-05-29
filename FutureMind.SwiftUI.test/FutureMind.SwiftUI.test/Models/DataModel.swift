//
//  DataModel.swift
//  FutureMind.SwiftUI.test
//
//  Created by Aleksander Pankow on 29/05/2022.
//
import Foundation
import SwiftyJSON
import RealmSwift

class DataModel: Object, Identifiable {
    @objc dynamic var title: String = ""
    @objc dynamic var image: String = ""
    @objc dynamic var details: String = ""
    @objc dynamic var url: String = ""
    @objc dynamic var modificationDate: String = ""
    @objc dynamic var id: Int = 0
    
    convenience init(_ json:JSON) {
        
        self.init()
        self.title = json["title"].stringValue
        self.image = json["image_url"].stringValue
        self.details = DataFormatter.removeUrl(
            input: json["description"].stringValue,
            removeUrl: DataFormatter.extractUrl(input: json["description"].stringValue)
        )
        self.url = DataFormatter.extractUrl(input: json["description"].stringValue)
        self.modificationDate = DataFormatter.changeDateFormat(input: json["modificationDate"].stringValue)
        self.id = json["orderId"].intValue
        
    }
    override class func primaryKey() -> String? {
        "id"
    }
}
