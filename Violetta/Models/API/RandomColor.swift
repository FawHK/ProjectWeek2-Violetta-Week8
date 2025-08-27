//
//  RandomColor.swift
//  Violetta
//
//  Created by Kevin Waltz on 25.09.24.
//

import SwiftUI

struct RandomColor: Codable {
    let rgb: RGB
    let name: Name
    
    
    var color: Color {
        let red = Double(rgb.r)
        let green = Double(rgb.g)
        let blue = Double(rgb.b)
        
        return Color(red: red/255, green: green/255, blue: blue/255, opacity: 255/255)
    }
}

struct RGB: Codable {
    let r, g, b: Int
}

struct Name: Codable {
    let value: String
}
