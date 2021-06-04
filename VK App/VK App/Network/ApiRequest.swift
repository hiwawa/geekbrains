//
//  ApiRequests.swift
//  VK App
//
//  Created by Aleksander Pankow on 23/01/2021.
//

import Foundation
import Alamofire
import SwiftyJSON
import RealmSwift

class ApiRequest: NetworkSession {
    
    //Get Groups
    static func loadGroups(token: String, id: Int..., completion: @escaping ([GroupList]) -> Void) {
        let baseUrl = "https://api.vk.com"
        let path = "/method/groups.get"
        
        let params: Parameters = [
            "access_token": token,
            "extended": 1,
            "user_id": id,
            "v": "5.126"
        ]
        
        AF.request(baseUrl + path,
                   method: .get,
                   parameters: params)
            .responseData { response in
                switch response.result {
                case .success(let data):
                    let json = JSON(data)
                    let groupsJSON = json["response"]["items"].arrayValue
                    let groups = groupsJSON.compactMap { GroupList($0) }
                    completion(groups)
                    
                case .failure(let error) :
                    print(error)
                }
                
            }
    }
    
    static func loadPhotos(token: String, id: Int..., completion: @escaping ([PhotoList]) -> Void) {
        let baseUrl = "https://api.vk.com"
        let path = "/method/photos.get"
        
        let params: Parameters = [
            "access_token": token,
            "extended": 1,
            "album_id": "profile",
            "v": "5.126"
        ]
        
        AF.request(baseUrl + path,
                   method: .get,
                   parameters: params)
            .responseData { response in
                switch response.result {
                case .success(let data):
                    let json = JSON(data)
                    let photosJSON = json["response"]["items"].arrayValue
                    print(photosJSON)
                    let photos = photosJSON.compactMap { PhotoList($0) }
                    completion(photos)
                    
                case .failure(let error) :
                    print(error)
                }
                
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
    static func loadFriends(token: String, completion: @escaping ([FriendList]) -> Void) {
        let baseUrl = "https://api.vk.com"
        let path = "/method/friends.get"
        
        let params: Parameters = [
            "access_token": token,
            "extended": 1,
            "v": "5.126",
            "fields": "id,name,online,photo_200"
        ]
        
        AF.request(baseUrl + path,
                   method: .get,
                   parameters: params)
            .responseData { response in
                switch response.result {
                case .success(let data):
                    let json = JSON(data)
                    let friendsJSON = json["response"]["items"].arrayValue
                    let friends = friendsJSON.compactMap { FriendList($0) }
                    
                    completion(friends)

                case .failure(let error) :
                    print(error)
                }
                
            }

    }
    //Get User
    static func loadUser(token: String, completion: @escaping ([UserModel]) -> Void) {
        let baseUrl = "https://api.vk.com"
        let path = "/method/users.get"
        print("API TOKEN \(token)")
        let params: Parameters = [
            "access_token": token,
            "extended": 1,
            "v": "5.126",
            "fields": "first_name, last_name, photo_400_orig, domain, screen_name"
        ]
        
        AF.request(baseUrl + path,
                   method: .get,
                   parameters: params)
            .responseData { response in
                switch response.result {
                case .success(let data):
                    let json = JSON(data)
                    let userJSON = json["response"].arrayValue
                    let user = userJSON.compactMap { UserModel($0) }
                    //print(user)
                    completion(user)

                case .failure(let error) :
                    print(error)
                }
                
            }

    }
    //Get MainWall
    static func loadMainWall(token: String, completion: @escaping ([MainWall]) -> Void) {
        let baseUrl = "https://api.vk.com"
        let path = "/method/wall.get"
        
        let params: Parameters = [
            "access_token": token,
            "extended": 1,
            "v": "5.126"
        ]
        
        AF.request(baseUrl + path,
                   method: .get,
                   parameters: params)
            .responseData { response in
                switch response.result {
                case .success(let data):
                    let json = JSON(data)
                    let mainwallJSON = json["response"]["items"].arrayValue
                    let wallposts = mainwallJSON.compactMap { MainWall($0) }
                    completion(wallposts)

                case .failure(let error) :
                    print(error)
                }
                
            }

    }

}
