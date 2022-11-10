//
//  ConcCircle.swift
//  Weatherly
//
//  Created by jian.mikee.pacheco on 9/8/22.
//

import SwiftUI

struct ConcCircle: View {
    // MARK: - PROPERTY
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    // MARK: - BODY
    var body: some View {
        Group {
            Circle()
                .opacity( 0.2 )
                .scaleEffect( 1 )
                .frame(width: 68, height: 68, alignment: .center)
            Circle()
                .opacity( 0.15 )
                .scaleEffect( 1 )
                .frame(width: 88, height: 88, alignment: .center)
        }
        .foregroundColor(Color("ConcCircleColor"))
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

// MARK: - PREVIEW
struct AddButton_Previews: PreviewProvider {
    static var previews: some View {
        ConcCircle()
            .previewLayout(.sizeThatFits)
    }
}
