//
//  RealmService.swift
//  VK App
//
//  Created by Aleksander Pankow on 03/02/2021.
//

import Foundation
import RealmSwift

class RealmService {
    static let deleteIfMigration = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
    
    static func save <T: Object>(items: [T],
                                 configuration: Realm.Configuration = deleteIfMigration,
                                 update: Realm.UpdatePolicy = .modified) throws {
        let realm = try Realm(configuration: configuration)
        print(configuration.fileURL ?? "")
        try realm.write{
            realm.add(items, update: update)
        }
    }
}
