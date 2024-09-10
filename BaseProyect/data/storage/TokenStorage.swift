//
//  TokenStorage.swift
//  BaseProyect
//
//  Created by Najib Loera on 22/08/24.
//

import Foundation

class TokenStorage {
    private let tokenKey = "authToken"
    
    // Save token
    func saveToken(_ token: String) {
        UserDefaults.standard.set(token, forKey: tokenKey)
    }
    
    // Clear token
    func clearToken() {
        UserDefaults.standard.removeObject(forKey: tokenKey)
    }
    
    func retrieveToken() -> String? {
          return UserDefaults.standard.string(forKey: tokenKey)
      }
}
