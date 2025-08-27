//
//  ColorPreview.swift
//  Violetta
//
//  Created by Kevin Waltz on 26.09.24.
//

import SwiftUI

struct ColorPreview: View {
    
    // MARK: - Properties
    
    let color: RandomColor
    let numberOfColor: Int
    
    
    
    // MARK: - Body
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: Values.minorPadding) {
                RoundedRectangle(cornerRadius: Values.cornerRadiusPreview)
                    .foregroundStyle(color.color)
                    .frame(height: geometry.size.width)
                    .shadow(color: .primary.opacity(0.15), radius: 24)
                    .animation(.easeInOut, value: numberOfColor)
                
                Text(color.name.value)
                    .font(.title)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
            }
        }
    }
    
}
