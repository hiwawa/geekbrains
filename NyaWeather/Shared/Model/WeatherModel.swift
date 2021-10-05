//
//  WeatherModel.swift
//  NyaWeather
//
//  Created by Aleksander Pankow on 31/08/2021.
//

import Foundation
import SwiftyJSON
import RealmSwift

class Weather: Object, ObjectKeyIdentifiable, Codable, Identifiable  {
    @objc dynamic var id: Int = 0
    @objc dynamic var title: String = ""
    @objc dynamic var information: String = ""
    @objc dynamic var temp: String = ""
    @objc dynamic var city: String = ""
    
    convenience init(_ json:JSON)
    {
        self.init()
        self.id = json["id"].intValue
        self.title = json["weather"][0]["main"].stringValue
        self.information = json["weather"][0]["description"].stringValue
        self.temp = json["main"]["temp"].stringValue
        self.city = json["name"].stringValue
        
    }
    override class func primaryKey() -> String? {
        "id"
    }
}
