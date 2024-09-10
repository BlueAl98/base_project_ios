//
//  LoginViewModel.swift
//  BaseProyect
//
//  Created by Najib Loera on 22/08/24.
//

import SwiftUI
import Combine

@MainActor
class LoginViewModel: ObservableObject {
    @Published var username: String = "info@gastiganto.com"
    @Published var password: String = "secret"
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    @Published var user: Login?
    
    private let loginUseCase: LoginUseCase
    private let tokenStorage = TokenStorage()

    
    init(loginUseCase: LoginUseCase) {
        self.loginUseCase = loginUseCase
    }
    
    func login() {
        Task {
            isLoading = true
            errorMessage = nil
            do {
                let user = try await loginUseCase.execute(username: username, password: password)
                self.user = user
                                
            } catch {
                errorMessage = error.localizedDescription
            }
            isLoading = false
        }
    }
    
    func deleteToken()  {
        tokenStorage.clearToken()
    }
    
    
    func clearError(){
        errorMessage = nil
    }
}
