//
//  URL.swift
//  Weatherly
//
//  Created by jian.mikee.pacheco on 9/8/22. 
//

import Foundation
import Combine
import SwiftUI

struct weatherAPI {
    
    static func getURLWeather(latitude: Double, longitude: Double) -> String {
        return "https://api.openweathermap.org/data/2.5/forecast?lat=\(latitude)&lon=\(longitude)&appid=378be90077518412616838336958f7a9&units=metric"
    }
    
//    static func getURLCurrentWeather(latitude: Double, longitude: Double) -> URL? {
//        return URL(string: "https://api.openweathermap.org/data/2.5/forecast?lat=\(latitude)&lon=\(longitude)&appid=378be90077518412616838336958f7a9&units=metric")
//    }
}

