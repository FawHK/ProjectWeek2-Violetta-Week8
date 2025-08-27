//
//  FireColor.swift
//  Violetta
//
//  Created by Kevin Waltz on 26.09.24.
//

import SwiftUI
import FirebaseFirestore

struct FireColor: Codable, Identifiable {
    
    // MARK: - Properties
    
    @DocumentID var id: String?
    
    let userId: String
    let rgb: RGB
    let name: String
    let addedOn: Date
    var note: String?
    
    
    var color: Color {
        let red = Double(rgb.r)
        let green = Double(rgb.g)
        let blue = Double(rgb.b)
        
        return Color(red: red/255, green: green/255, blue: blue/255, opacity: 255/255)
    }
    
    
    
    // MARK: - Init
    
    init(userId: String, color: RandomColor) {
        self.userId = userId
        self.rgb = color.rgb
        self.name = color.name.value
        self.addedOn = Date()
    }
    
}
