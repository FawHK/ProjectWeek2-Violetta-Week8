//
//  CircleButton.swift
//  Violetta
//
//  Created by Kevin Waltz on 26.09.24.
//

import SwiftUI

struct CircleButton: View {
    
    // MARK: - Properties
    
    var foregroundColor: Color = .white
    let backgroundColor: Color
    let icon: String
    let action: () -> Void
    
    
    
    // MARK: - Body
    
    var body: some View {
        Button(action: action) {
            Image(systemName: icon)
                .font(.title2)
                .padding(Values.minorPadding)
                .frame(minWidth: 48, minHeight: 48)
                .background(backgroundColor)
                .foregroundStyle(foregroundColor)
                .clipShape(Circle())
        }
        .buttonStyle(.plain)
    }
    
}

#Preview {
    CircleButton(backgroundColor: .purple, icon: "heart") { }
}
