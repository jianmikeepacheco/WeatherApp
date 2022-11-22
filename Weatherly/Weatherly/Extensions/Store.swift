//
//  Store.swift
//  Weatherly
//
//  Created by jian.mikee.pacheco on 9/8/22.
//

import Foundation
import SwiftUI

class Store: ObservableObject {
    
    @Published var tempUnit: TemperatureUnit = .celsius
    @Published var weatherLocList: [WeatherVM] = [WeatherVM]()
    
    init() {
        tempUnit = UserDefaults.standard.unit
    }
    
    func addWeather(_ weather: WeatherVM) {
        weatherLocList.append(weather)
    }
    
}
