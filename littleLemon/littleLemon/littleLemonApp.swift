//
//  littleLemonApp.swift
//  littleLemon
//
//  Created by Jon Spight on 1/31/24.
//

import SwiftUI

@main
struct littleLemonApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            OnboardingView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
