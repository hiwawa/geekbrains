//
//  ApiRequests.swift
//  FutureMind.SwiftUI.test
//
//  Created by Aleksander Pankow on 29/05/2022.
//

import Foundation
import Alamofire
import SwiftyJSON
import RealmSwift

class ApiRequest: NetworkSession {
    
    static func loadData(completion: @escaping ([DataModel]) -> Void) {
        
        let url = "https://recruitment-task.futuremind.dev/recruitment-task"
        
        let queue = DispatchQueue(label: "com.futuremind.async", qos: .background, attributes: [.concurrent])
        AF.request(url,
                   method: .get)
        .responseData(queue:queue) { response in
            switch response.result {
            case .success(let data):
                let json = JSON(data)
                let dataJSON = json.arrayValue
                let data = dataJSON.compactMap { DataModel($0) }
                
                //print(json)
                
                DispatchQueue.main.async{
                    completion(data)
                }
                
            case .failure(let error) :
                print(error)
            }
        }
    }
}
