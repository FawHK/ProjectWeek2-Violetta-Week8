//
//  FavoriteView.swift
//  Violetta
//
//  Created by Kevin Waltz on 26.09.24.
//

import SwiftUI

struct FavoriteView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject private var favoritesViewModel: FavoritesViewModel
    
    let color: FireColor
    
    @State private var showAlert = false
    
    
    
    // MARK: - Body
    
    var body: some View {
        HStack(spacing: Values.minorPadding) {
            RoundedRectangle(cornerRadius: Values.cornerRadiusInside)
                .foregroundStyle(color.color)
                .frame(width: Values.previewSize, height: Values.previewSize)
            
            VStack(spacing: Values.minorPadding / 4) {
                Text(color.name)
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("R: \(color.rgb.r) • G: \(color.rgb.g) • B: \(color.rgb.b)")
                    .font(.callout)
                    .foregroundStyle(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            Button(action: deleteAlert) {
                Image(systemName: "heart.slash")
            }
            .tint(.purple)
        }
        .padding(Values.minorPadding)
        .background(.defaultBackground)
        .clipShape(RoundedRectangle(cornerRadius: Values.cornerRadiusOutside))
        
        .alert("Delete Color", isPresented: $showAlert) {
            Button(role: .destructive, action: deleteColor) {
                Text("Delete")
            }
        } message: {
            Text("Your Favorite Color will be deleted! Are you sure?")
        }
    }
    
    // MARK: - Functions
    
    private func deleteColor() {
        favoritesViewModel.deleteColor(with: color.name)
    }
    
    private func deleteAlert() {
        showAlert.toggle()
    }
    
}
