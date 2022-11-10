//
//  About.swift
//  Weatherly
//
//  Created by jian.mikee.pacheco on 9/8/22.
//

import SwiftUI

struct About: View {
    
    // MARK: - BODY
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            Image(systemName: "sun.dust.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
            
            Spacer()
            Text("iOS Coding Exercise - Weather Application for iOS Mobile Application Developer Bootcamp. ")
                .font(.subheadline)
                .multilineTextAlignment(.leading)
        }
    }
}

// MARK: - PREVIEW
struct About_Previews: PreviewProvider {
    static var previews: some View {
        About()
            .previewLayout(.sizeThatFits)
    }
}
