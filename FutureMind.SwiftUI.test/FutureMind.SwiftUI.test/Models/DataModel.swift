//
//  DataModel.swift
//  FutureMind.SwiftUI.test
//
//  Created by Aleksander Pankow on 29/05/2022.
//

import Foundation
import SwiftyJSON
import RealmSwift

class DataModel: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var image: String = ""
    @objc dynamic var details: String = ""
    @objc dynamic var url: String = ""
    @objc dynamic var modificationDate: String = ""
    @objc dynamic var id: Int = 0
    
    let ModelFormatter = {
        func getUrl(input:String) -> String{
            let detector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
            let matches = detector.matches(in: input, options: [], range: NSRange(location: 0, length: input.utf16.count))
            var url: String = ""
            
            for match in matches {
                guard let range = Range(match.range, in: input) else { continue }
                url = String(input[range])
            }
            
            return url
        }
    }
    
    private func getUrl(input:String) -> String{
        let detector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        let matches = detector.matches(in: input, options: [], range: NSRange(location: 0, length: input.utf16.count))
        var url: String = ""
        
        for match in matches {
            guard let range = Range(match.range, in: input) else { continue }
            url = String(input[range])
        }
        
        return url
    }
    
    private func removeUrl(input:String, removeUrl:String) -> String {
        var input = input
        var formatedText = ""
        if let range = input.range(of: removeUrl) {
            input.removeSubrange(range)
            formatedText = input
        }
        return formatedText
    }
    
    convenience init(_ json:JSON) {
        
        self.init()
        self.title = json["title"].stringValue
        self.image = json["image_url"].stringValue
        self.details = removeUrl(
            input: json["description"].stringValue,
            removeUrl: getUrl(input: json["description"].stringValue)
        )
        self.url = getUrl(input: json["description"].stringValue)
        self.modificationDate = json["modificationDate"].stringValue
        self.id = json["orderId"].intValue
        
    }
    override class func primaryKey() -> String? {
        "id"
    }
}
