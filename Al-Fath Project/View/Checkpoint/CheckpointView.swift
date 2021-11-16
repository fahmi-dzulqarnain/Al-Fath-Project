//
//  CheckpointView.swift
//  Al-Fath Project
//
//  Created by Rio Sudarsono on 14/11/21.
//

import SwiftUI

struct CheckpointView: View {
//    @Binding var isShow:Bool
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var progress: CGFloat = 33
    @State private var selection = 0
    @ObservedObject var viewModel = ChallengeViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                VStack{
                    HStack {
                        Image("ic_close")
                            .resizable()
                            .frame(width: 16, height: 16)
                            .onTapGesture {
    //                            isShow = false
                                presentationMode.wrappedValue.dismiss()
                            }
                        Spacer()
                    }
                    ProgressBarView(percent: progress)
                }.padding()
                
                if selection == 0 {
                    HurufView(selected: $selection, progress: $progress)
                } else if selection == 1 {
                    KataView(selected: $selection, progress: $progress)
                } else if selection == 2 {
                    PencocokanView(viewModel: viewModel)
                }
                
//                TabView(selection : $selection){
//                    HurufView(selected: $selection, progress: $progress).tag(0)
//                    KataView(selected: $selection, progress: $progress).tag(1)
//                    PencocokanView().tag(2)
//                }
//                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
//                .animation(.easeInOut)
//                .transition(.slide)
            }
            .padding(.top, 48)
            .onAppear(perform: {
                viewModel.randomQuiz()
            })
            
            
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .background(Color.primary)
        .edgesIgnoringSafeArea(.vertical)
    }
}

//struct CheckpointView_Previews: PreviewProvider {
//    static var previews: some View {
//        CheckpointView(isShow: .constant(true))
//    }
//}
