//
//  DiscoverViewModel.swift
//  Violetta
//
//  Created by Kevin Waltz on 25.09.24.
//

import SwiftUI

@MainActor
class DiscoverViewModel: ObservableObject {
    
    // MARK: - Properties
    
    private let colorRepository = ColorRepository()
    
    @Published var randomColor: RandomColor?
    @Published var numberOfColor = 0
    
    
    
    // MARK: - Init
    
    init() {
        fetchRandomColor()
    }
    
    
    
    // MARK: - Functions
    
    func fetchRandomColor() {
        Task {
            do {
                self.randomColor = try await self.colorRepository.fetchRandomColor()
                self.numberOfColor += 1
            } catch {
                print(error)
            }
        }
    }
}
