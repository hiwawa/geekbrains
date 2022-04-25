//
//  ParseData.swift
//  VK App
//
//  Created by Aleksander Pankow on 24/08/2021.
//

import Foundation
import SwiftyJSON
import RealmSwift

class ParseData: Operation {

    var outputData: [GroupModel] = []
    override func main() {
           guard let getDataOperation = dependencies.first as? GetDataOperation,
               let data = getDataOperation.data else { return }
           let json = JSON(data)
        let groupsVK: [GroupModel] = json.flatMap {
               let id = $0.1["id"].intValue
               let title = $0.1["title"].stringValue
               let logo = $0.1["logo"].stringValue
                return GroupModel(id: id, title: title, logo: logo)
           }
           outputData = groupsVK
           
       }
   }
