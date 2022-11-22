//
//  WeatherlyApp.swift
//  Weatherly
//
//  Created by jian.mikee.pacheco on 9/8/22.
//

import SwiftUI

@main
struct WeatherlyApp: App {
    
    //@StateObject var webService: WebService
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            //ContentView()
            HomeScreenView()
                .environmentObject(WebService())
                .environmentObject(Store())
                //.environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
