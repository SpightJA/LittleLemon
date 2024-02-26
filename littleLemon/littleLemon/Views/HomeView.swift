//
//  HomeView.swift
//  littleLemon
//
//  Created by Jon Spight on 1/31/24.
//

import SwiftUI

struct HomeView: View {
    let persistence = PersistenceController.shared
    @StateObject var model = Model()

    var body: some View {
        TabView(selection: $model.tabViewSelectedIndex) {
            MenuView().tabItem {
                if !model.displayingReservationForm {
                Label("Menu", systemImage: "list.dash")
            }
            }.tag(1).environment(\.managedObjectContext, persistence.container.viewContext)
                      
            LocationsView().tabItem {
                if !model.displayingReservationForm {
                    Label("Locations", systemImage: "fork.knife")
                }
            }.tag(2)
            
            ReservationView().tabItem {
                if !model.displayingReservationForm {
                    Label("Reservations", systemImage: "calendar")
                }
            }.tag(3)
            UserProfileView().tabItem {
                if !model.displayingReservationForm {
                Label("Profile", systemImage: "square.and.pencil").tint(.red)
            }
                
            }.tag(4)
            
            
            
        }
        .environmentObject(model)
        .navigationBarBackButtonHidden(true)
        .onAppear(){
            print(UserDefaults.standard.bool(forKey: kIsLoggedIn))
        }
    }
}

#Preview {
    HomeView()
}
