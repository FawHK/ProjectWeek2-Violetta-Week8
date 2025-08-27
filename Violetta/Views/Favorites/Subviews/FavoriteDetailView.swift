//
//  FavoriteDetailView.swift
//  Violetta
//
//  Created by Fawwaz Hajj Khalid on 01.10.24.
//

import SwiftUI

struct FavoriteDetailView: View {
    
    // MARK: - Properties
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var favoritesViewModel: FavoritesViewModel
    
    let color: FireColor
    
    @State private var newNote: String = ""
    
    
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Add Note")
                    .font(.subheadline.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                TextEditor(text: $newNote)
                    .foregroundStyle(.black)
                    .colorMultiply(.gray.opacity(0.2))
                    .cornerRadius(Values.middlePadding)
                    .frame(height: 100)
                    .padding(.bottom)
                
                
                Text("Your Note")
                    .font(.subheadline.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ScrollView {
                    if let colorNote = color.note {
                        Text(colorNote)
                            .padding()
                            .font(.headline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(color.color.opacity(0.2))
                            .clipShape(RoundedRectangle(cornerRadius: Values.cornerRadiusInside))
                    }
             
                }
                .scrollIndicators(.hidden)
                
                Spacer()
                
                PrimaryButton(title: "Save", backgroundColor: color.color, action: addNote)

            }
            .padding()
            .navigationTitle(color.name)
        }
    }
    
    // MARK: - Functions
    
    private func addNote() {
        favoritesViewModel.addNote(with: color.id, note: newNote)
        newNote = ""
        dismiss()
    }
}

