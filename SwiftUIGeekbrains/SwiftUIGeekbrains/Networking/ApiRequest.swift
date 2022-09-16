//
//  ApiRequest.swift
//  SwiftUIGeekbrains
//
//  Created by Aleksander Pankow on 07/05/2022.
//

import Foundation
import Alamofire
import SwiftyJSON
import RealmSwift
import SwiftUI

class ApiRequest: NetworkSession {
    
    static func loadUsers(completion: @escaping ([UserModel]) -> Void) {
        
        let baseUrl = "https://api.vk.com"
        let path = "/method/users.get"
        
        let params: Parameters = [
            "access_token": UserDefaults.standard.object(forKey: "vkToken") as! String,
            "extended": 1,
            "v": "5.131",
            "fields": "bdate,domain,photo_400_orig,screen_name,online"
        ]
        let queue = DispatchQueue(label: "com.vk.async", qos: .background, attributes: [.concurrent])
        AF.request(baseUrl + path,
                   method: .get,
                   parameters: params)
        .responseData(queue:queue) { response in
            switch response.result {
            case .success(let data):
                let json = JSON(data)
                let userJSON = json["response"].arrayValue
                let user = userJSON.compactMap { UserModel($0) }
                
                //print(json)
                
                DispatchQueue.main.async{
                    completion(user)
                }
                
            case .failure(let error) :
                print(error)
            }
            
        }
        
    }
    
    static func loadFriends(completion: @escaping ([FriendModel]) -> Void) {
        
        let baseUrl = "https://api.vk.com"
        let path = "/method/friends.get"
        
        let params: Parameters = [
            "access_token": UserDefaults.standard.object(forKey: "vkToken") as! String,
            "extended": 1,
            "v": "5.131",
            "fields": "bdate,nickname,photo_200_orig,online"
        ]
        let queue = DispatchQueue(label: "com.vk.async", qos: .background, attributes: [.concurrent])
        AF.request(baseUrl + path,
                   method: .get,
                   parameters: params)
        .responseData(queue:queue) { response in
            switch response.result {
            case .success(let data):
                let json = JSON(data)
                let friendJSON = json["response"]["items"].arrayValue
                let friend = friendJSON.compactMap { FriendModel($0) }
                
                //print(friendJSON)
                
                DispatchQueue.main.async{
                    completion(friend)
                }
                
            case .failure(let error) :
                print(error)
            }
            
        }
        
    }
    
    static func loadGroups(completion: @escaping ([GroupModel]) -> Void) {
        
        let baseUrl = "https://api.vk.com"
        let path = "/method/groups.get"
        
        let params: Parameters = [
            "access_token": UserDefaults.standard.object(forKey: "vkToken") as! String,
            "extended": 1,
            "v": "5.131"
        ]
        let queue = DispatchQueue(label: "com.vk.async", qos: .background, attributes: [.concurrent])
        AF.request(baseUrl + path,
                   method: .get,
                   parameters: params)
        .responseData(queue:queue) { response in
            switch response.result {
            case .success(let data):
                let json = JSON(data)
                let groupJSON = json["response"]["items"].arrayValue
                let group = groupJSON.compactMap { GroupModel($0) }
                
                //print(groupJSON)
                
                DispatchQueue.main.async{
                    completion(group)
                }
                
            case .failure(let error) :
                print(error)
            }
            
        }
        
    }
    
    static func loadNewsFeed(completion: @escaping ([NewsModel]) -> Void) {
        
        let baseUrl = "https://api.vk.com"
        let path = "/method/newsfeed.get"
        
        let params: Parameters = [
            "access_token": UserDefaults.standard.object(forKey: "vkToken") as! String,
            "extended": 1,
            "v": "5.131",
            "count": 15
        ]
        let queue = DispatchQueue(label: "com.vk.async", qos: .background, attributes: [.concurrent])
        AF.request(baseUrl + path,
                   method: .get,
                   parameters: params)
        .responseData(queue:queue) { response in
            switch response.result {
            case .success(let data):
                let json = JSON(data)
                let newsJSON = json["response"]["items"].arrayValue
                let news = newsJSON.compactMap { NewsModel($0) }
                
                //print(newsJSON)
                
                DispatchQueue.main.async{
                    completion(news)
                }
                
            case .failure(let error) :
                print(error)
            }
            
        }
        
    }
    static func loadWall(completion: @escaping ([WallModel]) -> Void) {
        
        let baseUrl = "https://api.vk.com"
        let path = "/method/wall.get"
        
        let params: Parameters = [
            "access_token": UserDefaults.standard.object(forKey: "vkToken") as! String,
            "extended": 1,
            "v": "5.131",
            "count": 15
        ]
        let queue = DispatchQueue(label: "com.vk.async", qos: .background, attributes: [.concurrent])
        AF.request(baseUrl + path,
                   method: .get,
                   parameters: params)
        .responseData(queue:queue) { response in
            switch response.result {
            case .success(let data):
                let json = JSON(data)
                let wallJSON = json["response"]["items"].arrayValue
                let wall = wallJSON.compactMap { WallModel($0) }
                
                print(wallJSON)
                
                DispatchQueue.main.async{
                    completion(wall)
                }
                
            case .failure(let error) :
                print(error)
            }
            
        }
        
    }
    static func likes(id: Int, action: String, owner: Int) {
        
        let baseUrl = "https://api.vk.com"
        let path = "/method/likes.\(action)"
        
        let params: Parameters = [
            "access_token": UserDefaults.standard.object(forKey: "vkToken") as! String,
            "type": "post",
            "item_id": id,
            "owner_id": owner,
            "v": "5.131"
        ]
        let queue = DispatchQueue(label: "com.vk.async", qos: .background, attributes: [.concurrent])
        AF.request(baseUrl + path,
                   method: .post,
                   parameters: params)
        .responseData(queue:queue) { response in
            switch response.result {
            case .success(let data):
                let json = JSON(data)
                //let likeJSON = json["response"]["items"].arrayValue
                print(json)
                
            case .failure(let error) :
                print(error)
            }
            
        }
        
    }
}
