//
//  BaseProyectApp.swift
//  BaseProyect
//
//  Created by Najib Loera on 21/08/24.
//

import SwiftUI

@main
struct BaseProyectApp: App {
    
    @StateObject private var viewModel = LoginViewModel(
            loginUseCase: LoginUseCase(
                repository: AuthRepositoryImpl()
            )
        )

     
    var body: some Scene {
             WindowGroup {
                Contentview()
                     .environmentObject(viewModel)
             
         }
    }
}
