//
//  AuthenticationView.swift
//  Violetta
//
//  Created by Kevin Waltz on 26.09.24.
//

import SwiftUI

struct AuthenticationView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject private var userViewModel: UserViewModel
    
    
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                MeshGradient(width: 2, height: 2,
                    points: [
                        .init(x: 0, y: 0), .init(x: 1, y: 0),
                        .init(x: 0, y: 1), .init(x: 1, y: 1),
                    ], colors: [.red, .orange, .pink, .purple, .blue]
                )
                .ignoresSafeArea()
                
                PlaceholderView(icon: "paintpalette.fill", title: "Willkommen bei", subtitle: "Violetta!", foregroundStyle: .white)
                
                NavigationLink(destination: LoginView()) {
                    Image(systemName: "arrow.forward.circle.fill")
                        .resizable()
                        .frame(width: 48, height: 48)
                        .tint(.white)
                }
                .padding(.bottom, Values.majorPadding)
            }
            .statusBarHidden()
        }
        .navigationBarBackButtonHidden(true)
        .environmentObject(userViewModel)
    }
    
}

#Preview {
    AuthenticationView()
        .environmentObject(UserViewModel())
}
