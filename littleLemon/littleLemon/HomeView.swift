//
//  HomeView.swift
//  littleLemon
//
//  Created by Jon Spight on 1/31/24.
//

import SwiftUI

struct HomeView: View {
    let persistence = PersistenceController.shared
    var body: some View {
        TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
            MenuView().tabItem { Label("Menu", systemImage: "list.dash") }.tag(1).environment(\.managedObjectContext, persistence.container.viewContext)
            UserProfileView().tabItem { Label("Profile", systemImage: "square.and.pencil") }.tag(2)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    HomeView()
}
