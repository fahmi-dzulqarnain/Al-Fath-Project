//
//  Al_Fath_ProjectApp.swift
//  Al-Fath Project
//
//  Created by Muhammad Firdaus on 07/10/21.
//

import SwiftUI

@main
struct Al_Fath_ProjectApp: App {
    let persistenceController = PersistneceController.shared
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
//            MainView()
            OnboardingView().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: scenePhase) { (newScenePhase) in
            switch newScenePhase {
            case .background:
                print("Scene is in background")
                persistenceController.save()
            case .inactive:
                print("Scene is inactive")
            case .active:
                print("Scene is active")
            @unknown default:
                print("Apple must have changed something")
            }
        }
    }
}
