//
//  ColorRepository.swift
//  Violetta
//
//  Created by Kevin Waltz on 25.09.24.
//

import Foundation

class ColorRepository {
    func fetchRandomColor() async throws -> RandomColor? {
        let urlString = "https://www.thecolorapi.com/random?format=json"
        
        guard let url = URL(string: urlString) else {
            throw HTTPError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(RandomColor.self, from: data)
    }
}
