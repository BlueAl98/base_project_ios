//
//  MainScreen.swift
//  BaseProyect
//
//  Created by Najib Loera on 22/08/24.
//

import SwiftUI

struct ManageScreen: View {
    
    @State var presentSideMenu = false
    @State var selectedSideMenuTab = 0
    
    var body: some View {
        ZStack{
            
            TabView(selection: $selectedSideMenuTab) {
                HomeScreen(presentSideMenu: $presentSideMenu)
                    .tag(0)
            
            }
          
            SideMenu(isShowing: $presentSideMenu, content: AnyView(SideMenuView(selectedSideMenuTab: $selectedSideMenuTab, presentSideMenu: $presentSideMenu)))
        }
        
      
    }
}

