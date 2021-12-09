//
//  WeatherObjectModel.swift
//  NyaWeather
//
//  Created by Aleksander Pankow on 09/11/2021.
//

import Foundation
import ObjectMapper

class WeatherObjectModel: Mappable, ObservableObject {
    required init?(map: Map) {
    }
    
    var main: WeatherMainModel?
    
    func mapping(map: Map) {
        main <- map["main"]
    }
    
}

class WeatherMainModel: Mappable{
    required init?(map: Map) {
    }
    var temperature: Float?
    func mapping(map: Map) {
        temperature <- map["temp"]
    }

}
