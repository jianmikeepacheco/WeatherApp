//
//  Constants.swift
//  Weatherly
//
//  Created by jian.mikee.pacheco on 9/8/22.
//

import Foundation
import SwiftUI

//MARK: - Hard Coded Manila (Main)

//final class Constants: ObservableObject {
//
//    @StateObject var webService = WebService()
//
//    class Location {
        
        //static var currentLocation = "Manila City"
        //static var currentLocation = webService.currentPlacemark?.administrativeArea ?? ""
//    }
//}


//MARK: - Current Loc

final class Constants: ObservableObject {

    @StateObject var webService = WebService()

    var currentLocation = WebService().currentPlacemark?.administrativeArea ?? ""
}


