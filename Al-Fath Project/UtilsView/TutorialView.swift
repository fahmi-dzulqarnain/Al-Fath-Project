//
//  TutorialView.swift
//  Al-Fath Project
//
//  Created by Rio Sudarsono on 30/11/21.
//

import SwiftUI

struct TutorialView: View {
    @Binding var isShow: Bool
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                Image("ic_rectangle_black")
                    .resizable()
                    .scaledToFit()
                    .padding(.all, 24)
                Text("Letak tangan berada \n di dalam kotak ")
                    .bold()
                    .font(.system(size: 20))
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .padding()
            }.padding(.bottom, 80)
            
            Spacer()
        }
        .background(isShow ? Color.white.opacity(0.7) : Color.clear).edgesIgnoringSafeArea(.all)
        .edgesIgnoringSafeArea(.bottom)
        .onTapGesture {
            isShow.toggle()
            UserDefaults.standard.setTutorLearn(value: true)
        }
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView(isShow: .constant(true))
    }
}
