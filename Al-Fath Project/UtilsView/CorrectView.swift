//
//  CorrectView.swift
//  Al-Fath Project
//
//  Created by Rio Sudarsono on 14/11/21.
//

import SwiftUI
import AVKit
import CoreHaptics

struct CorrectView: View {
    @Binding var isShow: Bool
    @Binding var isCheckpoint: Bool
    @Binding var nextLearn: DictionaryData
    @ObservedObject var viewModel: LearnViewModel
    @ObservedObject var vm: DictionaryListViewModel
    @State var engine: CHHapticEngine?
    
    var body: some View {
        VStack{
            Spacer()
            VStack{
                Spacer()
                LottieView(name: "congratulation", loopMode: .playOnce)
                    .frame(width: 250, height: 250)
                    .padding()
                Text("Alhamdulillah Kamu bisa!")
                    .bold()
                    .font(.system(size: 20))
                    .foregroundColor(.text)
                Spacer()
                HStack {
                    Spacer()
                    Image(systemName: "chevron.right.circle.fill")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .foregroundColor(.colorGreen)
                        .padding(.all, 36)
                        .onTapGesture {
                            if isCheckpoint {
                                PersistneceController.shared.unlockNextLearn(title: viewModel.title)
                                viewModel.learn1Show = false
                                viewModel.checkPointShow = true
                                viewModel.page = 1
                            } else {
                                PersistneceController.shared.unlockNextLearn(title: viewModel.title)
                                viewModel.title = nextLearn.letter
                                viewModel.dataLearn = nextLearn
                                viewModel.player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: nextLearn.videoName, ofType: "mp4")!))
                                viewModel.page = 1
                            }
                        }
                }
                
            }
            .cornerRadius(25)
            .offset(y: isShow ? 0 : UIScreen.main.bounds.height)
            Spacer()

        }
        .background(Color.white.opacity(0.7))
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            isShow.toggle()
        }
        .onAppear {
           prepareHaptics()
           complexSuccess(engine: engine)
        }

    }
    
    func prepareHaptics() {
          guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }

          do {
              engine = try CHHapticEngine()
              try engine?.start()
          } catch {
              print("There was an error creating the engine: \(error.localizedDescription)")
          }
      }
}
