//
//  SplashScreen.swift
//  BaseProyect
//
//  Created by Najib Loera on 22/08/24.
//

import SwiftUI

struct SplashScreen: View {
    
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        VStack {
            Image("Logo") // Asegúrate de tener una imagen con este nombre en tu proyecto
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200) // Ajusta el tamaño según tus necesidades
        }
        .background(Color.white) // Puedes cambiar el color de fondo según tu diseño
        .scaleEffect(size)
        .opacity(opacity)
        .onAppear{
            withAnimation(.easeInOut(duration: 1.2)){
                self.size = 0.9
                self.opacity = 1.0
            }
        }
    }
}

#Preview {
    SplashScreen()
}
