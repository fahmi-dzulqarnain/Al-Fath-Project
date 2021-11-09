//
//  MainView.swift
//  Al-Fath Project
//
//  Created by Rio Sudarsono on 14/10/21.
//

import SwiftUI

struct MainView: View {
    
    @State private var selectedTab = 1
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color.primary)
    }
    
    var body: some View {
        ZStack {
            HStack {
            }
            .frame(height: 40)
            .cornerRadius(15)
            .background(Color.secondary)
            
            TabView(selection: $selectedTab) {
                LearnView().tabItem {
                    if selectedTab == 1 { Image("ic_learn_") }
                    else { Image("ic_learn") }
                }.tag(1)
    //            ChallengeView().tabItem {
    //                ChallengeView().getIconName()
    //                ChallengeView().gettabName()
    //            }.tag(2)
                DictionaryView().tabItem {
                    if selectedTab == 2 { Image("ic_dictionary_") }
                    else { Image("ic_dictionary") }
                }.tag(2)
                SettingsView().tabItem {
                    if selectedTab == 3 { Image("ic_settings_") }
                    else { Image("ic_settings") }
                }.tag(3)
            }
            
        }
        .background(Color.secondary)
    }
    
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
