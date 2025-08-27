//
//  SettingsView.swift
//  Violetta
//
//  Created by Fawwaz Hajj Khalid on 01.10.24.
//

import SwiftUI

struct SettingsView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject private var userViewModel: UserViewModel
    @EnvironmentObject private var favoritesViewModel: FavoritesViewModel
    
    @State private var showAlert: Bool = false
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                PrimaryButton(title: "Logout", backgroundColor: .darkRed, action: resetApp)
                PrimaryButton(title: "Reset", backgroundColor: .darkRed, action: resetApp)
                
            }
            .navigationTitle("Settings")
            .alert("Reset App", isPresented: $showAlert) {
                Button(role: .destructive, action: resetApp) {
                    Text("Reset")
                }
            } message: {
                Text("Are you sure, you want to reset the app.")
            }
        }
        .environmentObject(userViewModel)
    }
    
    // MARK: - Functions
    
    private func resetApp() {
        userViewModel.logout()
    }
    
    private func resetAlert() {
        showAlert.toggle()
    }
    
}

#Preview {
    SettingsView()
        .environmentObject(UserViewModel())
}


