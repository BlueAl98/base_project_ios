//
//  AuthRepository.swift
//  BaseProyect
//
//  Created by Najib Loera on 22/08/24.
//

import Foundation

protocol AuthRepository {
    func login(username: String, password: String) async throws -> Login
}
