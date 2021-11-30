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
    @State var showCorrect = false
    @State var isNext = false
    @State var huruf = 2
    
    var body: some View {
        ZStack{
            VStack {
                ZStack {
                    if huruf == 2 {
                        CameraView(bindedValue: viewModel.kata.latin2, onTrue: {
                            progress = 55
                            viewModel.kata.correct2 = true
                            showCorrect = true
                        }) {
                            overlayPoints = $0;
                        }
                    } else if huruf == 1 {
                        CameraView(bindedValue: viewModel.kata.latin1, onTrue: {
                            viewModel.kata.correct1 = true
                            isNext = true
                            showCorrect = true
                        }) {
                            overlayPoints = $0;
                        }
                    }
                    
                    HStack{
                        Spacer()
                        Image("ic_rectangle_white2")
                            .resizable()
                            .scaledToFit()
                            .padding()
                        Spacer()
                    }
                }.padding(.top, 100)
                
                HStack() {
                    Spacer()
                    Text(viewModel.kata.huruf1)
                        .foregroundColor(viewModel.kata.correct1 ? Color.black : Color.black.opacity(0.2))
                        .bold()
                        .font(.custom("ScheherazadeNew-Regular", size: 32, relativeTo: .largeTitle))
                    Image("ic_plus")
                        .padding(.horizontal, 24)
                    Text(viewModel.kata.huruf2)
                        .foregroundColor(viewModel.kata.correct2 ? Color.black : Color.black.opacity(0.2))
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
        
            }
            if showCorrect {
                Correct2View(isShow: $showCorrect, isNext: $isNext) {
                    selected = 2
                    progress = 80
                    pos = 3
                } onTap: {
                    huruf = 1
                    showCorrect = false
                }
            }
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
