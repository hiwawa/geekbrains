//
//  WeatherView.swift
//  NyaWeather
//
//  Created by Aleksander Pankow on 31/08/2021.
//

import SwiftUI
import RealmSwift
import Alamofire

struct WeatherView: View {
    
    func getWeather(){
        var weather = try? Realm().objects(Weather.self)
        var realmtoken: NotificationToken?
        ApiRequest.getForecast(city: "Warsaw") {
            weather in try? RealmService.save(items: weather)
        }
    }
    
    var currentWeather = weather.title
    
    var body: some View {
        Section{
            Text("\()")
        }.onAppear { self.getWeather() }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
