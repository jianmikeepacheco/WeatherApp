//
//  Settings.swift
//  Weatherly
//
//  Created by jian.mikee.pacheco on 9/8/22.
//

import Foundation

enum TemperatureUnit: String, CaseIterable, Identifiable {
    
    var id: String {
        return rawValue
    }
    case celsius
    case fahrenheit
}

extension TemperatureUnit {
    
    var displayText: String {
        switch self {
        case .celsius:
            return "Celsius"
        case .fahrenheit:
            return "Fahrenheit"
        }
    }
}

enum Sheets: Identifiable {
    
    var id: UUID {
        return UUID()
    }
    
    case settings
}



