//
//  AddLocation.swift
//  Weatherly
//
//  Created by jian.mikee.pacheco on 9/26/22.
//

import Foundation

struct AddLocation: Identifiable, Codable {
    var id: String = UUID().uuidString
    var location: String
    
    static var sampleData: [AddLocation] {
        [
            AddLocation(location: "Manila City")
        ]
    }
}
