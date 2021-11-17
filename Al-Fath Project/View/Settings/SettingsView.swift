//
//  SettingsView.swift
//  Al-Fath Project
//
//  Created by Rio Sudarsono on 14/10/21.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var isNotifyPhone : Bool = false
    @State private var isNotifyPractice : Bool = false
    @ObservedObject var viewModel = UserViewModel()
    
    let listBadges: [String] = [ "handmaster_badge", "newlight_badge", "best_badge", "fastlearner_badge"]
    let listBadgesName: [String] = ["Hand Master", "New Light", "The Best", "Fast Learner"]
    let listBadgesXP: [String] = ["150/150XP", "120/120XP", "180/180XP", "100/100XP"]
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: -70, alignment: .center),
        GridItem(.flexible(), spacing: -90, alignment: .center),
        ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                Image("abdullah")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .padding(.top, 32)
                Text("Abdullah")
                    .font(.system(size: 18))
                    .bold()
                Text("Batam, Indonesia")
                    .font(.system(size: 12))
                    .padding(.bottom, 24)
                Toggle(isOn: $viewModel.isHaptic, label: {
                    Text("Mode Getar")
                        .font(.system(size: 16))
                        .bold()
                }).toggleStyle(SwitchToggleStyle(tint: .orange))
                .padding(.bottom)
                .onTapGesture {
                    UserDefaults.standard.setHaptic(value: viewModel.isHaptic)
                }
                
                Toggle(isOn: $isNotifyPhone, label: {
                    VStack(alignment: .leading) {
                        Text("Notifikasi")
                            .font(.system(size: 16))
                            .bold()
                        Text("Pengingat Telpon")
                            .font(.system(size: 12))
                    }
                }).toggleStyle(SwitchToggleStyle(tint: .orange))
                
                Toggle(isOn: $isNotifyPractice, label: {
                    VStack(alignment: .leading) {
                        Text("Pengingat Latihan")
                            .font(.system(size: 12))
                    }
                }).toggleStyle(SwitchToggleStyle(tint: .orange))
                
                Text("Lencana")
                    .font(.system(size: 24))
                    .bold()
                    .padding(.all, 18)
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(Color.white, lineWidth: 4)
                    ).background(RoundedRectangle(cornerRadius: 14).fill(Color.primary))
                
            }
            .padding(.all, 24)
            LazyVGrid(columns: columns,
                 alignment: .center,
                      spacing: 24) {
                ForEach(listBadges.indices) { number in
                        VStack {
                            Image(listBadges[number])
                            Text(listBadgesName[number])
                                .foregroundColor(.text)
                                .fontWeight(.bold)
                            Text(listBadgesXP[number]).font(.system(size: 12))
                        }
                        .padding(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color.white, lineWidth: 4)
                        ).background(RoundedRectangle(cornerRadius: 40).fill(Color.primary))
                    }
                }
                .environment(\.layoutDirection, .rightToLeft)
                .padding(.bottom, 80)
            
        }
        .background(Color("ColorSecondary"))
        .edgesIgnoringSafeArea(.top)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("", displayMode: .inline)
    }
    
    var badge: some View {
        VStack {
            
        }
    }
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
