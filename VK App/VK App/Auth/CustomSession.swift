//
//  CustomSession.swift
//  VK App
//
//  Created by Aleksander Pankow on 25/12/2020.
//

import Foundation
import Alamofire

class CustomSession {
    static let session: Session = {
        let session = URLSessionConfiguration()
        session.timeoutIntervalForRequest = 60
        let afSession = Session(configuration: session)
        return afSession
    }()
    
    static let shared = CustomSession()
    public var token: String = ""
    
    
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

}
