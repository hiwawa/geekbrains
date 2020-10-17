//
//  GroupStruct.swift
//  VK App
//
//  Created by Aleksander Pankow on 16/10/2020.
//

import Foundation

class GroupModel {
    var name: String
    var description: String
    var status: String
    var owner: Int
    var alias: String
    var count: Int
    
    init(name: String, description: String, status: String, owner: Int, alias: String, count: Int) {
        self.name = name
        self.description = description
        self.status = status
        self.owner = owner
        self.alias = alias
        self.count = count
    }
}
