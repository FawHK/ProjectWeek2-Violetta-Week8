//
//  ViolettaApp.swift
//  Violetta
//
//  Created by Kevin Waltz on 24.09.24.
//

import SwiftUI
import Firebase

@main
struct ViolettaApp: App {
    
    // MARK: - Properties
    
    @StateObject private var userViewModel = UserViewModel()
    
    
    
    // MARK: - Init
    
    init() {
        FirebaseConfiguration.shared.setLoggerLevel(.min)
        FirebaseApp.configure()
    }
    
    
    
    // MARK: - Body
    
    var body: some Scene {
        WindowGroup {
            if userViewModel.userIsLoggedIn {
                NavigatorView()
                    .environmentObject(userViewModel)
            } else {
                AuthenticationView()
                    .environmentObject(userViewModel)
            }
        }
    }
    
}
