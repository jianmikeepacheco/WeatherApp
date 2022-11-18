//
//  LocationList.swift
//  Weatherly
//
//  Created by jian.mikee.pacheco on 9/8/22.
//

import SwiftUI

struct LocationList: View {
    // MARK: - PROPERTY
    
    let id = UUID()
    
    @StateObject var weatherVM = WeatherVM()
    
    let locationName: String
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    @EnvironmentObject var store: Store
    
    // MARK: - BODY
    var body: some View {
        HStack (alignment: .center, spacing: 0) {
            Text("\(weatherVM.currentLocation), \(weatherVM.currentCountry)")
                .font(.headline)
                .fixedSize()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            
            weatherVM.getWeatherIconFor(icon: weatherVM.dailyWeatherIcons[0])
                .resizable()
                .scaledToFit()
                .frame(width: 35, height: 35)
            
            VStack (alignment: .leading) {
                Text("\(weatherVM.getTempByUnit(unit: store.tempUnit)[0]) °\(String(store.tempUnit.displayText.prefix(1)))")
                Text("\(weatherVM.dailyConditions[0].uppercased())")
            }
            .font(.footnote)
            .frame(width: 100, alignment: .topTrailing)
            
        }
        //.padding(.vertical)
        .foregroundColor(Color("TextColor"))
        .background(RoundedRectangle(cornerRadius: 10)
            .foregroundColor(Color("ThemeColor"))
            .frame(width: 345, height: 60)
        )
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

// MARK: - PREVIEW
struct LocationList_Previews: PreviewProvider {
    static var previews: some View {
        LocationList(weatherVM: WeatherVM(), locationName: "Manila")
            .previewLayout(.sizeThatFits)
            .environmentObject(Store())
    }
}
