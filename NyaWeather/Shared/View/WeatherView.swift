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
    var currentTemp = {
        print("Func")
    }

    var body: some View {
        Section{
            Text("\(currentTemp)")
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
