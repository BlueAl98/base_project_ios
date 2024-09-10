//
//  ContentView.swift
//  BaseProyect
//
//  Created by Najib Loera on 22/08/24.
//

import SwiftUI

struct Contentview: View {
    
    @EnvironmentObject var viewModel : LoginViewModel
    @State private var showSplash = true
    @AppStorage("authToken") private var userToken: String?


    var body: some View {
        Group{
            if showSplash {
                          SplashScreen()
                               .preferredColorScheme(.light)
                               .onAppear{
                                   DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                         withAnimation {
                                         showSplash = false
                                        }
                                   }
                               }
                       
            } else {
                if userToken != nil{
                    ManageScreen()
                } else {
                    LoginScreen()
                }
              
            }
            
        }
      
       
    }
}
