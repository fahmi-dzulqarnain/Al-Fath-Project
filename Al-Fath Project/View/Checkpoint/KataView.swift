//
//  KataView.swift
//  Al-Fath Project
//
//  Created by Rio Sudarsono on 15/11/21.
//

import SwiftUI

struct KataView: View {
    @ObservedObject var viewModel: ChallengeViewModel
    @Binding var selected: Int
    @Binding var progress: CGFloat
    @Binding var pos: Int
    @State private var overlayPoints: [CGPoint] = []
    @State private var comingFromUIKitVC = ""
    
    var body: some View {
        ZStack{
            VStack {
                ZStack {
                    CameraView(bindedValue: $comingFromUIKitVC) {
                        overlayPoints = $0;
                    }
                    HStack{
                        Spacer()
                        Image("ic_rectangle_white")
                            .padding()
                        Spacer()
                    }
                }.padding(.top, 100)
                
                HStack() {
                    Spacer()
                    Text(viewModel.kata.huruf1)
                        .foregroundColor(.text)
                        .bold()
                        .font(.custom("ScheherazadeNew-Regular", size: 32, relativeTo: .largeTitle))
                    Image("ic_plus")
                        .padding(.horizontal, 24)
                    Text(viewModel.kata.huruf2)
                        .foregroundColor(.text)
                        .bold()
                        .font(.custom("ScheherazadeNew-Regular", size: 32, relativeTo: .largeTitle))
                    Spacer()
                }
                .padding(.vertical, 6)
                .background(Color.white.opacity(0.8))
                .cornerRadius(12)
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.2), radius: 5, x: 2, y: 2)
                .padding(.horizontal, 16)
                .padding(.top, 8)
                
                HStack {
                    Spacer()
                    Text(viewModel.kata.kata)
                        .foregroundColor(.text)
                        .bold()
                        .font(.custom("ScheherazadeNew-Regular", size: 52, relativeTo: .largeTitle))
                    Spacer()
                }
                .background(Color.white.opacity(0.8))
                .cornerRadius(12)
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.2), radius: 5, x: 2, y: 2)
                .padding()
                .onTapGesture {
                    selected = 2
                    progress = 80
                    pos = 3
                }
                   
                
            }
//            CorrectView(isShow: $isShow)
        }
        .padding(.bottom, 32)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .background(Color.greenLight)
        .edgesIgnoringSafeArea(.vertical)
        
    }
}

//struct KataView_Previews: PreviewProvider {
//    static var previews: some View {
//        KataView()
//    }
//}
