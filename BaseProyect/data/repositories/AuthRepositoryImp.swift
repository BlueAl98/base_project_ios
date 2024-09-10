//
//  AuthRepository.swift
//  BaseProyect
//
//  Created by Najib Loera on 22/08/24.
//

import Foundation

class AuthRepositoryImpl: AuthRepository {
  
    private let tokenStorage: TokenStorage

    init(tokenStorage: TokenStorage = TokenStorage()) {
            self.tokenStorage = tokenStorage
        }
  
    func login(username: String, password: String) async throws -> Login {
        guard let url = URL(string: Constants.BASE_URL + "login") else {
                  throw NetworkingError.invalidURL }
       
        var request = URLRequest(url: url)
               request.httpMethod = "POST"
               request.setValue("application/json", forHTTPHeaderField: "Content-Type")
               let body = ["email": username, "password": password]
               request.httpBody = try JSONSerialization.data(withJSONObject: body)

               let loginDTO: LoginDTO = try await Networking.shared.performRequest(request)
               let login = loginDTO.toDomain()
               tokenStorage.saveToken(login.token)
               return login
    }
}
