//
//  TextFields.swift
//  BaseProyect
//
//  Created by Najib Loera on 23/08/24.
//

import Foundation
import SwiftUI


struct SecureTextField: View {
    @Binding var text: String
    var placeholder: String = "Enter password"
    var borderColor: Color = Color.blue
    var cornerRadius: CGFloat = 10
    var borderWidth: CGFloat = 2
    
    @State private var isSecure: Bool = true
    
    var body: some View {
        HStack {
            if isSecure {
                SecureField(placeholder, text: $text)
                    .padding()
            } else {
                TextField(placeholder, text: $text)
                    .padding()
            }
            
            Button(action: {
                isSecure.toggle()
            }) {
                Image(systemName: self.isSecure ? "eye.slash" : "eye")
                    .foregroundColor(.gray)
            }
            .padding(.trailing, 8)
        }
        .background(RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(borderColor, lineWidth: borderWidth))
        .padding()
    }
}


struct GeneralTextField: View {
    @Binding var text: String
    var placeholder:String
    var borderColor: Color = Color.blue
    var cornerRadius: CGFloat = 10
    var borderWidth: CGFloat = 2
    
    var body: some View {
        TextField(placeholder, text: $text)
            
            .padding()
            .background(RoundedRectangle(cornerRadius: cornerRadius)
            .stroke(borderColor, lineWidth: borderWidth))
            .padding()
    }
}
