//
//  ApiRequest.swift
//  NyaWeather
//
//  Created by Aleksander Pankow on 31/08/2021.
//

import Foundation
import Alamofire
import SwiftyJSON
import RealmSwift

class ApiRequest: NetworkSession, ObservableObject {
    
    static func getForecast(city: String, completion: @escaping ([Weather]) -> Void) {
        let baseUrl = "https://api.openweathermap.org/data/2.5/forecast"
        
        let params: Parameters = [
            "q": "Warsaw",
            "appid": "f79080bd8972e92d510407063c4d444e",
            "units": "metric"
        ]
        
        let queue = DispatchQueue(label: "com.nyaweather.async", qos: .background, attributes: [.concurrent])
        
        AF.request(baseUrl,
                   method: .get, parameters: params)
            .responseData(queue:queue) { response in
                switch response.result {
                case .success(let data):
                    let json = JSON(data)
                    print(json)
                    let forecastJSON = json.arrayValue
                    print(forecastJSON)
                    let weather = forecastJSON.compactMap { Weather($0) }
                    DispatchQueue.main.async{
                        completion(weather)
                    }
                case .failure(let error) :
                    print(error)
                }
                
            }
    }
    
    static func getWeather(city: String, param: String) {
        let baseUrl = "https://api.openweathermap.org/data/2.5/weather"
        
        let params: Parameters = [
            "q": "Warsaw",
            "appid": "f79080bd8972e92d510407063c4d444e",
            "units": "metric"
        ]

        let queue = DispatchQueue(label: "com.nyaweather.async", qos: .background, attributes: [.concurrent])
        
        AF.request(baseUrl,
                   method: .get, parameters: params)
            .responseData(queue:queue) { response in
                switch response.result {
                case .success(let data):
                    let json = JSON(data)
                    if param == "temerature"{
                        return print(json["main"]["temp"])
                    } else if param == "name" {
                        return print(json["name"])
                    }
                    
                case .failure(let error) :
                    print(error)
                }
            }
    }
    
    
}

