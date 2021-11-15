//
//  CorrectView.swift
//  Al-Fath Project
//
//  Created by Rio Sudarsono on 14/11/21.
//

import SwiftUI

struct CorrectView: View {
    @Binding var isShow: Bool
    
    var body: some View {
        VStack{
            Spacer()
            HStack {
                Spacer()
                VStack{
                    Image("ic_checklist_green")
                        .resizable()
                        .frame(width: 60, height: 60)
                    Text("Benar")
                        .bold()
                        .font(.system(size: 24))
                        .foregroundColor(Color.colorGreen)
                }
                .padding(.vertical, 16)
                .padding(.horizontal, 32)
                .background(Color.white)
                .cornerRadius(8)
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.2), radius: 5, x: 2, y: 2)
                
                Spacer()
            }
            .padding(.bottom, (UIApplication.shared.windows.last?.safeAreaInsets.bottom)! + 10)
            .padding(.horizontal)
            .padding(.top, 15)
            .background(Color.clear)
            .cornerRadius(25)
            .offset(y: isShow ? 0 : UIScreen.main.bounds.height)
            Spacer()

        }
        .background(isShow ? Color.black.opacity(0.3) : Color.clear).edgesIgnoringSafeArea(.all)
        .edgesIgnoringSafeArea(.bottom)
        .onTapGesture {
            isShow.toggle()
        }
    }
}
