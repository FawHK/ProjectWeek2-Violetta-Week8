//
//  NavigatorView.swift
//  Violetta
//
//  Created by Kevin Waltz on 24.09.24.
//

import SwiftUI

struct NavigatorView: View {
    
    // MARK: - Properties
    
    @StateObject private var favoritesViewModel = FavoritesViewModel()
    @EnvironmentObject private var userViewModel: UserViewModel
    
    
    
    // MARK: - Body
    
    var body: some View {
        TabView {
            ForEach(Tab.allCases) { tab in
                tab.view
                    .tabItem {
                        Label(tab.title, systemImage: tab.icon)
                    }
                    .tint(.purple)
            }
        }
        .environmentObject(favoritesViewModel)
        .environmentObject(userViewModel)
    }
    
}

#Preview {
    NavigatorView()
}
