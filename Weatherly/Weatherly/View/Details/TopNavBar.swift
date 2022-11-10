//
//  TopNavBar.swift
//  Weatherly
//
//  Created by jian.mikee.pacheco on 9/8/22.
//

import SwiftUI

struct TopNavBar: View {
    // MARK: - PROPERTY
    
    let title: String
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color("ConcCircleColor"))
                .frame(width: 60, height: 30)
            
            Text(title)
                .foregroundColor(Color("TextColor"))
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

// MARK: - PREVIEW
struct TopNavBar_Previews: PreviewProvider {
    static var previews: some View {
        TopNavBar(title: "Add")
            .previewLayout(.sizeThatFits)
    }
}
