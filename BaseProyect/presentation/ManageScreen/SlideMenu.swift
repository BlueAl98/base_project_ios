//
//  SlideMenu.swift
//  BaseProyect
//
//  Created by Najib Loera on 22/08/24.
//

import SwiftUI

struct SideMenu: View {
    @Binding var isShowing: Bool
    var content: AnyView
    var edgeTransition: AnyTransition = .move(edge: .leading)
    var body: some View {
        ZStack(alignment: .bottom) {
            if (isShowing) {
                Color.black
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing.toggle()
                    }
                content
                    .transition(edgeTransition)
                    .background(
                        Color.clear
                    )
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(.easeInOut, value: isShowing)
    }
}


enum SideMenuRowType: Int, CaseIterable{
    case home = 0
    case favorite = 1
  //  case chat
    //case profile
    
    var title: String{
        switch self {
        case .home:
            return "Home"
        case .favorite:
            return "Favorite"
  //      case .chat:
  //          return "Chat"
   //     case .profile:
    //        return "Profile"
        }
    }
    
    var iconName: String{
        switch self {
        case .home:
            return "homekit"
        case .favorite:
            return "heart.fill"
      //  case .chat:
     //       return "chat"
    //    case .profile:
     //       return "profile"
        }
    }
}
