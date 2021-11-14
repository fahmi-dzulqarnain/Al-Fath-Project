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
    
    init() {
        //navigation bar
        let coloredNavAppearance = UINavigationBarAppearance()
        coloredNavAppearance.configureWithTransparentBackground()
        coloredNavAppearance.backgroundColor = UIColor(Color.primary)
        coloredNavAppearance.backgroundEffect = nil
        coloredNavAppearance.backgroundImage = UIImage()
        coloredNavAppearance.shadowImage = UIImage()
        coloredNavAppearance.shadowColor = .clear
        coloredNavAppearance.titleTextAttributes = [
            .foregroundColor: UIColor.black
        ]
        coloredNavAppearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.black
        ]
        
        UINavigationBar.appearance().standardAppearance = coloredNavAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
        UINavigationBar.appearance().compactAppearance = coloredNavAppearance
        
    }
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
