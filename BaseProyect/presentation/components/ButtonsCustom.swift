//
//  ButtonsCustom.swift
//  BaseProyect
//
//  Created by Najib Loera on 23/08/24.
//

import Foundation
import SwiftUI


struct GeneralButton: View {
    var buttonText: String
    var buttonColor: Color
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }) {
            Text(buttonText)
                .foregroundColor(.white)
                .padding()
                .background(buttonColor)
                .cornerRadius(10)
        }
        
    }
}
