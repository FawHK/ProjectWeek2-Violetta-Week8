//
//  ActionButtons.swift
//  Violetta
//
//  Created by Kevin Waltz on 26.09.24.
//

import SwiftUI

struct ActionButtons: View {
    
    // MARK: - Properties
    
    @EnvironmentObject private var discoverViewModel: DiscoverViewModel
    @EnvironmentObject private var favoritesViewModel: FavoritesViewModel
    
    
    
    // MARK: - Body
    
    var body: some View {
        HStack(spacing: Values.minorPadding / 2) {
            CircleButton(backgroundColor: .teal,
                         icon: "arrow.clockwise",
                         action: discoverViewModel.fetchRandomColor)
            
            CircleButton(backgroundColor: .purple,
                         icon: favoritesViewModel.isFavoriteColor(discoverViewModel.randomColor?.name.value) ? "heart.fill" : "heart") {
                favoritesViewModel.setColorAsFavorite(discoverViewModel.randomColor)
            }
        }
        .padding(Values.minorPadding / 2)
        .background(.defaultBackground)
        .clipShape(Capsule())
    }
    
}

#Preview {
    ActionButtons()
        .environmentObject(DiscoverViewModel())
        .environmentObject(FavoritesViewModel())
}
