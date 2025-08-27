//
//  LoginView.swift
//  Violetta
//
//  Created by Fawwaz Hajj Khalid on 02.10.24.
//

import SwiftUI

struct LoginView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject private var userViewModel: UserViewModel
    
    @State private var email = ""
    @State private var password = ""
    
    let gradient = Gradient(colors: [Color("darkRed") , Color("newPurple")])
    
    
    
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
                
                VStack {
                    Text("Log In")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .fontDesign(.rounded)
                        .bold()
                        .padding(.bottom, 50)
                    
                    TextField("Email", text: $email)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 360)
                        .background(.clear)
                        .cornerRadius(24)
                        
                    SecureField("Password", text: $password)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 360)
                        .cornerRadius(24)
                        .padding(.bottom, 50)
                        
                        PrimaryButton(title: "Log in", backgroundColor: .darkRed, action: login)
                        
                        PrimaryButton(title: "As a Guest", backgroundColor: .darkRed, action: anonymousLogin)
  
                    Spacer()
                    
                    HStack {
                        Text("Don't have an account ? ")
                            .font(.subheadline)
                            .bold()
                            .foregroundStyle(.white)
                        
                        Button {
                            userViewModel.register(email: email, password: password)
                        } label: {
                            Text("Register")
                                .bold()
                                .foregroundStyle(.darkRed)
                        }
                    }
                }
      
            }
            .statusBarHidden()
        }
        .navigationBarBackButtonHidden(true)
        .environmentObject(userViewModel)
    }
    
    // MARK: - Functions
    
    private func login() {
        userViewModel.login(email: email, password: password)
    }
    
    private func anonymousLogin() {
        userViewModel.loginAnonymously()
    }
}

#Preview {
    LoginView()
        .environmentObject(UserViewModel())
}
