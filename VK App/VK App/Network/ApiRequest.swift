//
//  ApiRequests.swift
//  VK App
//
//  Created by Aleksander Pankow on 23/01/2021.
//

import Foundation
import Alamofire

class ApiRequest: NetworkSession {
    
    //Get Groups
    static func loadGroups(token: String) {
        let baseUrl = "https://api.vk.com"
        let path = "/method/groups.get"
        
        let params: Parameters = [
            "access_token": token,
            "extended": 1,
            "v": "5.126"
        ]
        
        AF.request(baseUrl + path,
                   method: .get,
                   parameters: params)
            .responseJSON { json in
                print(json)
            }
    }
    
    //Get Groups by Key
    static func loadGroupsKey(token: String, query: String) {
        let baseUrl = "https://api.vk.com"
        let path = "/method/groups.search"
        
        let params: Parameters = [
            "access_token": token,
            "extended": 1,
            "q": query,
            "count": 3,
            "v": "5.126"
        ]
        
        AF.request(baseUrl + path,
                   method: .get,
                   parameters: params)
            .responseJSON { json in
                print(json)
            }
    }
    
    //Get Friends
    static func loadFriends(token: String) {
        let baseUrl = "https://api.vk.com"
        let path = "/method/friends.get"
        
        let params: Parameters = [
            "access_token": token,
            "extended": 1,
            "v": "5.126"
        ]
        
        AF.request(baseUrl + path,
                   method: .get,
                   parameters: params)
            .responseJSON { json in
                print(json)
            }
    }

}
