//
//  MainView.swift
//  Al-Fath Project
//
//  Created by Rio Sudarsono on 14/10/21.
//

import SwiftUI
import AVFoundation

struct MainView: View {
    
    @State private var selectedTab = 1
    @ObservedObject var learnVM = LearnViewModel()
    @ObservedObject var dictionaryVM = DictionaryListViewModel()
    var player: AVPlayer
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color.primary)
        player = AVPlayer()
    }
    
    var body: some View {
        ZStack {
            ZStack(alignment: .bottom) {
                if selectedTab == 1 {
                    LearnView(viewModel: learnVM)
                } else if selectedTab == 2{
                    DictionaryListView(vm: dictionaryVM)
                } else if selectedTab == 3 {
                    SettingsView()
                }
                
                HStack{
                    Spacer()
                    if selectedTab == 1 { Image("ic_learn_").onTapGesture {
                        selectedTab = 1
                    } }
                    else { Image("ic_learn").onTapGesture {
                        selectedTab = 1
                    } }
                    
                    Spacer()
                    if selectedTab == 2 { Image("ic_dictionary_").onTapGesture {
                        selectedTab = 2
                    } }
                    else { Image("ic_dictionary").onTapGesture {
                        selectedTab = 2
                    } }
                    
                    Spacer()
                    if selectedTab == 3 { Image("ic_settings_").onTapGesture {
                        selectedTab = 3
                    } }
                    else { Image("ic_settings").onTapGesture {
                        selectedTab = 3
                    } }
                    Spacer()
                }
                .padding(.top, 16)
                .padding(.bottom, 24)
                .background(Color.primary)
                .cornerRadius(16)
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.2), radius: 5, x: 2, y: 2)
            }
            .background(Color.secondary)
            .cornerRadius(8)
            .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.2), radius: 5, x: 2, y: 2)
            
            NavigationLink(destination: DictionaryView(vm: dictionaryVM, player: player),isActive: $dictionaryVM.showDictionary) {
            }
            
        }
//        .background(Color.black.opacity(0.8))
        .background(Color.secondary)
        .cornerRadius(8)
        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.2), radius: 5, x: 2, y: 2)
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.vertical)
    }
    
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
