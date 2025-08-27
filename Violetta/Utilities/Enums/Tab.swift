//
//  Tab.swift
//  Violetta
//
//  Created by Kevin Waltz on 24.09.24.
//

import SwiftUI

enum Tab: String, CaseIterable, Identifiable {
    case discover, favorites, settings
    
    
    var id: String { rawValue }
    
    var title: String {
        switch self {
        case .discover: "Entdecken"
        case .favorites: "Favoriten"
        case .settings: "Settings"
        }
    }
    
    var icon: String {
        switch self {
        case .discover: "paintpalette"
        case .favorites: "heart"
        case .settings: "gearshape.2"
        }
    }
    
    var view: some View {
        Group {
            switch self {
            case .discover: DiscoverView()
            case .favorites: FavoritesView()
            case .settings: SettingsView()
            }
        }
    }
    
}
