//
//  PlaceholderView.swift
//  Violetta
//
//  Created by Kevin Waltz on 26.09.24.
//

import SwiftUI

struct PlaceholderView: View {
    
    // MARK: - Properties
    
    let icon: String
    let title: String
    var subtitle: String = ""
    let foregroundStyle: Color
    
    
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: Values.majorPadding) {
            Spacer()
            
            Image(systemName: icon)
                .font(.system(size: 150))
                
            VStack(spacing: 0) {
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                
                if !subtitle.isEmpty {
                    Text(subtitle)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                }
            }
            
            Spacer()
        }
        .foregroundStyle(foregroundStyle)
    }
    
}

#Preview {
    PlaceholderView(icon: "paintpalette.fill", title: "Willkommen bei", subtitle: "Violetta!", foregroundStyle: .white)
}
