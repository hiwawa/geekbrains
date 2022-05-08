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

class ApiRequest: NetworkSession {
    static func loadCurrentUser(token: String, completion: @escaping ([UserModel]) -> Void) {
        let baseUrl = "https://api.vk.com"
        let path = "/method/users.get"
        
        let params: Parameters = [
            "access_token": token,
            "extended": 1,
            "v": "5.126",
            "fields": "first_name, last_name, photo_400_orig, domain, screen_name"
        ]
        let queue = DispatchQueue(label: "com.halalfood.async", qos: .background, attributes: [.concurrent])
        AF.request(baseUrl + path,
                   method: .get,
                   parameters: params)
        .responseData(queue:queue) { response in
            switch response.result {
            case .success(let data):
                let json = JSON(data)
                let userJSON = json["response"].arrayValue
                let user = userJSON.compactMap { UserModel($0) }
                //print(user)
                DispatchQueue.main.async{
                    completion(user)
                }
                
            case .failure(let error) :
                print(error)
            }
            
        }
        
    }
}
