//
//  FavoritesView.swift
//  Violetta
//
//  Created by Kevin Waltz on 24.09.24.
//

import SwiftUI

struct FavoritesView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject private var favoritesViewModel: FavoritesViewModel
    
    
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack {
            Group {
                if favoritesViewModel.colors.isEmpty {
                    PlaceholderView(icon: "heart.slash", title: "Keine Favoriten", foregroundStyle: .primary)
                } else {
                    ScrollView {
                        VStack(spacing: Values.minorPadding / 2) {
                            ForEach(favoritesViewModel.colors) { color in
                                NavigationLink {
                                    FavoriteDetailView(color: color)
                                } label: {
                                    FavoriteView(color: color)
                                }
                                
                            }
                        }
                        .padding([.horizontal, .bottom], Values.minorPadding)
                    }
                }
            }
            .navigationTitle(Tab.favorites.title)
        }
    }
    
}

#Preview {
    FavoritesView()
        .environmentObject(FavoritesViewModel())
}
