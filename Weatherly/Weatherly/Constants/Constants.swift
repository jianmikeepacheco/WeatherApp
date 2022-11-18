//
//  Constants.swift
//  Weatherly
//
//  Created by jian.mikee.pacheco on 9/8/22.
//

import Foundation
import SwiftUI
import CoreLocation

// MARK: - Hard Coded Manila (Main)

//final class Constants: NSObject, ObservableObject {
//
//    class Location {
//        static var currentLocation = "Manila City"
//    }
//}

// MARK: - Variable cityName

//final class Constants: NSObject, ObservableObject {
//
//    private var webService = WebService()
//
//    ERROR - Current Location is not showing
//    var cityName: String {
//        return webService.currentPlacemark?.administrativeArea ?? ""
//        }
//}


// MARK: - Nested Class
//class Constants {
//
//    @EnvironmentObject var webService: WebService
//
//    class Location {
//        func getLocation(city: String) -> String {
//            return webService.currentPlacemark?.administrativeArea ?? ""
//        }
//    }
//}


 //MARK: - Method 3
class Constants {

    @EnvironmentObject var webService: WebService
    
    
     //ERROR - Thread 1: Fatal error: No ObservableObject of type WebService found. A View.environmentObject(_:) for WebService may be missing as an ancestor of this view.
    lazy var currentLocation = webService.currentPlacemark?.administrativeArea ?? ""

}

