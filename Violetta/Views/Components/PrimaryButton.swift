//
//  PrimaryButton.swift
//  Violetta
//
//  Created by Fawwaz Hajj Khalid on 01.10.24.
//

import SwiftUI

struct PrimaryButton: View {
    
    // MARK: - Properties
    
    let title: String
    let foregroundColor: Color = .white
    let backgroundColor: Color
    let action: () -> Void
    
    
    
    // MARK: - Body
    
    var body: some View {
        Button(action: action ) {
            Text(title)
                .bold()
                .padding()
                .foregroundStyle(foregroundColor)
                .frame(maxWidth: 360)
                .background(backgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: Values.cornerRadiusPreview))
        }
    }
}

#Preview {
    PrimaryButton(title: "button", backgroundColor: .red) { }
}
