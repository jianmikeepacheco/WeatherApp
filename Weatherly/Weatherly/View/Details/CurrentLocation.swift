//
//  CurrentLocation.swift
//  Weatherly
//
//  Created by jian.mikee.pacheco on 9/8/22.
//

import SwiftUI

struct CurrentLocation: View {
    // MARK: - PROPERTY
    
    @EnvironmentObject var webService: WebService
    
    @ObservedObject var weatherVM = WeatherVM()
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    // MARK: - BODY
    var body: some View {
        VStack {
            //Text("\(weatherVM.currentLocation)")
            Text("\(webService.currentPlacemark?.administrativeArea ?? "")")
                .font(.largeTitle)
                .font(.largeTitle)
                .fontWeight(.heavy)
            
            Text("\(weatherVM.currentDate)")
        }
        .foregroundColor(Color("TextColor"))
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

// MARK: - PREVIEW
struct CurrentLocation_Previews: PreviewProvider {
    static var previews: some View {
        CurrentLocation()
            .previewLayout(.sizeThatFits)
    }
}
