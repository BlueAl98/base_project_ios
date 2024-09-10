//
//  LoginUseCase.swift
//  BaseProyect
//
//  Created by Najib Loera on 22/08/24.
//

import Foundation

class LoginUseCase {
    private let repository: AuthRepository
    
    init(repository: AuthRepository) {
        self.repository = repository
    }
    
    func execute(username: String, password: String) async throws -> Login{
        return try await repository.login(username: username, password: password)
    }
}
