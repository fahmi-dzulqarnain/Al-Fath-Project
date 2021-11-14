//
//  CheckpointView.swift
//  Al-Fath Project
//
//  Created by Rio Sudarsono on 14/11/21.
//

import SwiftUI

struct CheckpointView: View {
    @Binding var isShow:Bool
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Image("ic_close")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .onTapGesture {
                            isShow = false
                        }
                    Spacer()
                }
                .padding()
                
                Spacer()
                Text("ب")
                    .foregroundColor(.text)
                    .bold()
                    .font(.custom(Constans.textArab, size: 84))
            }
            .padding(.top, 48)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .background(Color.primary)
        .edgesIgnoringSafeArea(.vertical)
    }
}

struct CheckpointView_Previews: PreviewProvider {
    static var previews: some View {
        CheckpointView(isShow: .constant(true))
    }
}
