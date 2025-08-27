//
//  DiscoverView.swift
//  Violetta
//
//  Created by Kevin Waltz on 24.09.24.
//

import SwiftUI

struct DiscoverView: View {
    
    // MARK: - Properties
    
    @StateObject private var discoverViewModel = DiscoverViewModel()
    
    
    
    // MARK: - Body
    
    var body: some View {
            VStack(spacing: Values.majorPadding) {
                Text("Entdecke tolle Farben für deine Projekte!")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                
                VStack(spacing: Values.minorPadding) {
                    if let randomColor = discoverViewModel.randomColor {
                        ColorPreview(color: randomColor, numberOfColor: discoverViewModel.numberOfColor)
                    } else {
                        Spacer()
                        ProgressView()
                        Spacer()
                    }
                    
                    Spacer()
                    
                    ActionButtons()
                        .environmentObject(discoverViewModel)
                }
            }
            .padding(Values.majorPadding)
        
    }
    
}

#Preview {
    DiscoverView()
    
}
