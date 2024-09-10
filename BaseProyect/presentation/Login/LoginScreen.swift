//
//  ContentView.swift
//  BaseProyect
//
//  Created by Najib Loera on 21/08/24.
//

import SwiftUI

struct LoginScreen: View {
    
    @EnvironmentObject var viewModel: LoginViewModel
    @State var isActive : Bool = true

    var body: some View {
        ZStack{
        VStack {
            
            Image("Logo").resizable().scaledToFit()
            GeneralTextField(text: $viewModel.username, placeholder: "email")
            SecureTextField(text: $viewModel.password)
            GeneralButton(buttonText: "Login", buttonColor: Color.blue, action: {viewModel.login()})
    
        }
        .padding()
            
            if let errorMessage = viewModel.errorMessage {
                DialogMessage(isActive: $isActive, dismissExtraEvent: {
                    isActive = false
                    viewModel.clearError()
                }, title: "Ha ocurrido un problema", message: errorMessage, buttonTitle: "Cancelar", action: {
                    viewModel.clearError()
                    isActive = false
                })
            }
            
            if viewModel.isLoading{
                Color.gray.opacity(0.4)
                           .ignoresSafeArea()
                ProgressView()
                    .scaleEffect(1.5)
                    .background(.clear)
            }
        
    }
          }
}


