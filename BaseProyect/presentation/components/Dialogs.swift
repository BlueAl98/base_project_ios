//
//  Dialogs.swift
//  BaseProyect
//
//  Created by Najib Loera on 22/08/24.
//

import SwiftUI

struct DialogMessage: View {
    @Binding var isActive: Bool
    let  dismissExtraEvent : () -> ()?

    let title: String
    let message: String
    let buttonTitle: String
    let action: () -> ()
    @State private var offset : CGFloat = 1000

    var body: some View {
        ZStack {
            Color(.black)
                .opacity(0.5)
                .onTapGesture {
                    close()
                    dismissExtraEvent()
                }

            VStack {
                Text(title)
                    .foregroundColor(.black)
                    .bold()
                    .padding()

                Text(message).foregroundColor(.black)

                Button {
                    action()
                    close()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(Color.blue)

                        Text(buttonTitle)
                            .foregroundColor(.white)
                            .padding(8)
                    }
                    .padding()
                }
            }
            .fixedSize(horizontal: false, vertical: true)
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(radius: 20)
            .padding(30)
            .offset(x: 0, y: offset)
          .onAppear {
                withAnimation(.spring()) {
                    offset = 0
                }
            }
        }
        .ignoresSafeArea()
    }

    func close() {
        isActive = false
        withAnimation(.spring()) {
            offset = 1000
        }
    }
}


struct DialogConfirmation: View {
    @Binding var isActive: Bool
    let  dismissExtraEvent : () -> ()?

    let title: String
    let message: String
    let buttonConfirmationTitle: String
    let buttonCancelTitle: String
    let action: () -> ()
    let actionCancel: () -> ()?
    @State private var offset : CGFloat = 1000

    var body: some View {
        ZStack {
            Color(.black)
                .opacity(0.5)
                .onTapGesture {
                    close()
                    dismissExtraEvent()
                }

            VStack {
                Text(title)
                    .foregroundColor(.black)
                    .padding()

                Text(message).foregroundColor(.black)
                 
                HStack{
                    Button {
                        actionCancel()
                        close()
                    } label: {
                        ZStack {
                         /*   RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.red)*/

                            HStack{
                                Text(buttonCancelTitle)
                                    .foregroundColor(.black)
                                    .padding()
                            
                            }
                           
                        }
                        .padding()
                    }
                    
                    Spacer()
                    
                    Button {
                        action()
                        close()
                    } label: {
                        ZStack {
                           /* RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.blue)*/

                            HStack{
                                Text(buttonConfirmationTitle)
                                    .foregroundColor(Color.orange)
                                    .padding()
                            }
                           
                        }
                        .padding()
                    }
                }
                 
                
                
            }
            .fixedSize(horizontal: false, vertical: true)
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(radius: 20)
            .padding(20)
            .offset(x: 0, y: offset)
          .onAppear {
                withAnimation(.spring()) {
                    offset = 0
                }
            }
        }
        .ignoresSafeArea()
    }

    func close() {
        isActive = false
        withAnimation(.spring()) {
            offset = 1000
        }
    }
}


