//
//  HomeView.swift
//  littleLemon
//
//  Created by Jon Spight on 1/31/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
//            Text("Tab Content 1").tabItem { /*@START_MENU_TOKEN@*/Text("Tab Label 1")/*@END_MENU_TOKEN@*/ }.tag(1)
            MenuView().tabItem { Label("Menu", systemImage: "list.dash") }.tag(1)
            UserProfileView().tabItem { Label("Profile", systemImage: "square.and.pencil") }.tag(2)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    HomeView()
}
