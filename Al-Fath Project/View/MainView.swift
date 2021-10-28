//
//  MainView.swift
//  Al-Fath Project
//
//  Created by Rio Sudarsono on 14/10/21.
//

import SwiftUI

struct MainView: View {
    
    @State private var selectedTab = 1
    
    var body: some View {
        TabView(selection: $selectedTab) {
            LearnView().tabItem {
                LearnView().getIconName()
                LearnView().gettabName()
            }.tag(1)
            ChallengeView().tabItem {
                ChallengeView().getIconName()
                ChallengeView().gettabName()
            }.tag(2)
            DictionaryView().tabItem {
                DictionaryView().getIconName()
                DictionaryView().gettabName()
            }.tag(3)
            SettingsView().tabItem {
                SettingsView().getIconName()
                SettingsView().gettabName()
            }.tag(4)
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
