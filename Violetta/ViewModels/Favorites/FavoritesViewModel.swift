//
//  FavoritesViewModel.swift
//  Violetta
//
//  Created by Kevin Waltz on 26.09.24.
//

import Foundation

class FavoritesViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var colors: [FireColor] = []
    
    
    
    // MARK: - Init
    
    init() {
        fetchFavoriteColors()
    }
    
    
    
    
    // MARK: - Functions
    
    func isFavoriteColor(_ name: String?) -> Bool {
       colors.contains { $0.name == name }
    }
    
    func setColorAsFavorite(_ color: RandomColor?) {
        if isFavoriteColor(color?.name.value) {
            deleteColor(with: color?.name.value)
        } else {
            addColor(color)
        }
    }
    
    private func addColor(_ color: RandomColor?) {
        guard let userId = FirebaseManager.shared.userId, let color else { return }
        
        let post = FireColor(userId: userId, color: color)
        
        do {
            try FirebaseManager.shared.database.collection("colors").addDocument(from: post)
        } catch let error {
            print("Fehler beim Speichern der Farbe: \(error)")
        }
    }
    
    func deleteColor(with name: String?) {
        guard let name, let id = colors.first(where: { $0.name == name })?.id else { return }
        
        FirebaseManager.shared.database.collection("colors").document(id).delete() { error in
            if let error {
                print("Farbe kann nicht gelöscht werden", error)
                return
            }
            
            print("Farbe mit ID \(id) gelöscht")
        }
    }
    
    private func fetchFavoriteColors() {
        guard let userId = FirebaseManager.shared.userId else { return }
        
        FirebaseManager.shared.database.collection("colors")
            .whereField("userId", isEqualTo: userId)
            .order(by: "addedOn", descending: false)
            .addSnapshotListener { querySnapshot, error in
                if let error {
                    print(error)
                    return
                }
                
                guard let documents = querySnapshot?.documents else {
                    print("Fehler beim Laden der Farben")
                    return
                }
                
                self.colors = documents.compactMap {
                    try? $0.data(as: FireColor.self)
                }
            }
    }
    
    func addNote(with id: String?, note: String) {
        guard let id else { return }
        
        let data = ["note": note]
        
        FirebaseManager.shared.database.collection("colors").document(id).updateData(data) { error in
            if let error {
                print("Fehler beim Speichern der Notiz", error)
                return
            }
            
            print("Notiz für Farbe mit ID \(id) gespeichert")
        }
    }
}
