//
//  Al_Fath_ProjectApp.swift
//  Al-Fath Project
//
//  Created by Muhammad Firdaus on 07/10/21.
//

import SwiftUI

@main
struct Al_Fath_ProjectApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
//            MainView()
            OnboardingView()
        }
    }
}
