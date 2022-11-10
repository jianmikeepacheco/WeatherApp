//
//  WeatherPane.swift
//  Weatherly
//
//  Created by jian.mikee.pacheco on 9/19/22.
//

import SwiftUI

struct WeatherPane: View {
    // MARK: - PROPERTY
    
    var image: String
    var value: String
    
    // MARK: - BODY
    var body: some View {
        VStack (alignment: .center) {
            Image("\(image)")
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
            
            Text("\(value)")
                .fontWeight(.light)
                .font(.subheadline)
        }
    }
}

// MARK: - PREVIEW
struct WeatherPane_Previews: PreviewProvider {
    static var previews: some View {
        WeatherPane(image: "Umbrella", value: "30")
    }
}
