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
    @State var progress: CGFloat = 15
    @State private var selection = 0
    @State var pos = 1
    @ObservedObject var viewModel: ChallengeViewModel
    
    var body: some View {
        ZStack(alignment: .top) {
            if selection == 0 {
                HurufView(viewModel: viewModel, selected: $selection, progress: $progress, pos: $pos)
            } else if selection == 1 {
                KataView(viewModel: viewModel, selected: $selection, progress: $progress, pos: $pos)
            } else if selection == 2 {
                PencocokanView(viewModel: viewModel).padding(.top, 150)
            }
            
            VStack{
                HStack {
                    Image("ic_close")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .foregroundColor(Color.white)
                        .onTapGesture {
                            presentationMode.wrappedValue.dismiss()
                        }
                    Spacer()
                }
                ProgressBarView(percent: progress, pos: pos)
            }
            .padding(.top, 48)
            .padding()
            .background(Color.colorGreen)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .background(Color.greenLight)
        .edgesIgnoringSafeArea(.vertical)
        .onAppear(perform: {
            viewModel.randomQuiz()
        })
    }
}

//struct CheckpointView_Previews: PreviewProvider {
//    static var previews: some View {
//        CheckpointView(isShow: .constant(true))
//    }
//}
