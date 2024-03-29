//
//  HurufView.swift
//  Al-Fath Project
//
//  Created by Rio Sudarsono on 15/11/21.
//

import SwiftUI

struct HurufView: View {
    @ObservedObject var viewModel: ChallengeViewModel
    @Binding var selected: Int
    @Binding var progress: CGFloat
    @Binding var pos: Int
    @State private var overlayPoints: [CGPoint] = []
    @State private var comingFromUIKitVC = ""
    @State var isShow = false
    @State var showCorrect = false
    @State var isNext = true
    
    var body: some View {
        ZStack{
            VStack {
                ZStack {
                    CameraView(bindedValue: viewModel.latin.lowercased(), onTrue: {
                        showCorrect = true
                    }) {
                        overlayPoints = $0;
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
                
                HStack {
                    Spacer()
                    Text(viewModel.huruf)
                        .foregroundColor(.text)
                        .bold()
                        .font(.custom("ScheherazadeNew-Regular", size: 52, relativeTo: .largeTitle))
                    Spacer()
                }
                .padding(.vertical)
                .background(Color.white.opacity(0.8))
                .cornerRadius(12)
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.2), radius: 5, x: 2, y: 2)
                .padding()
            }
            if showCorrect {
                Correct2View(isShow: $showCorrect, isNext: $isNext) {
                    selected = 1
                    progress = 45
                    pos = 2
                } onTap: {
                    
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

//struct HurufView_Previews: PreviewProvider {
//    static var previews: some View {
//        HurufView()
//    }
//}
