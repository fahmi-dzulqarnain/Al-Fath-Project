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
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                Image(systemName: "person.circle.fill")
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
                })
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
                })
                
                Toggle(isOn: $isNotifyPractice, label: {
                    VStack(alignment: .leading) {
                        Text("Pengingat Latihan")
                            .font(.system(size: 12))
                    }
                })
                
                Text("Lencana")
                    .font(.system(size: 24))
                    .bold()
                    .padding(.all, 30)
                
            }
            .padding(.all, 16)
        }
        .background(Color.secondary)
        .edgesIgnoringSafeArea(.top)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
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
