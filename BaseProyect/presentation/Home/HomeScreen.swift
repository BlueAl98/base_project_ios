//
//  HomeScreen.swift
//  BaseProyect
//
//  Created by Najib Loera on 22/08/24.
//

import SwiftUI

struct HomeScreen: View {
    @Binding var presentSideMenu: Bool
    @State private var showPopover = false
    @EnvironmentObject var viewModel : LoginViewModel
    @State private var showAlertDialog : Bool = false
    @State var isActive : Bool = true


    
    var body: some View {
        NavigationStack{
            
            ZStack{
                
                Text("SOMETHING")
                
                    .navigationTitle("TOOLBAR TITLE")
                    .toolbar{
                        
                        ToolbarItem(placement: .topBarLeading, content: {
                            Button{
                                presentSideMenu.toggle()
                            } label: {
                                Image(systemName: "line.horizontal.3")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                            }
                            .onTapGesture {
                                showPopover  = false
                            }
                        })
                        
                        ToolbarItem(placement: .topBarTrailing, content: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(.blue)
                                .rotationEffect(Angle(degrees: 90.0))
                                .onTapGesture {
                                    showPopover = true
                                }
                                .popover(isPresented: $showPopover, attachmentAnchor:.point(.center),
                                         arrowEdge: .top,
                                         content: {
                                    Text("Cerrar sesión")
                                        .font(Font.custom("Roboto-Light", size: 16))
                                        .onTapGesture {
                                            showPopover  = false
                                            showAlertDialog.toggle()
                                        }
                                        .padding()
                                        .presentationCompactAdaptation(.none)
                                })
                        })
                 
                    }
                
                if showAlertDialog {
                    DialogConfirmation(isActive: $isActive, dismissExtraEvent: {
                        isActive = false
                        showAlertDialog.toggle()
                    }, title: "Cerrar sesión", message: "¿Desea salir de la aplicación?", buttonConfirmationTitle: "Salir" ,buttonCancelTitle: "Cancelar" , action: { viewModel.deleteToken()}, actionCancel: {
                        showAlertDialog.toggle()
                        isActive = false
                    })
                }
            }
        }
    }
}


