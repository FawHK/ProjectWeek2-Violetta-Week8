//
//  FirebaseManager.swift
//  Violetta
//
//  Created by Kevin Waltz on 26.09.24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class FirebaseManager {
    
    static let shared = FirebaseManager()
    
    let auth = Auth.auth()
    let database = Firestore.firestore()
    
    
    var userId: String? {
        auth.currentUser?.uid
    }
    
}
