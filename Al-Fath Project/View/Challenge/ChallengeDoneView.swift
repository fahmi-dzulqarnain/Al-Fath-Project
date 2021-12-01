//
//  ChallengeDoneView.swift
//  Al-Fath Project
//
//  Created by Rio Sudarsono on 04/11/21.
//

import SwiftUI
import CoreHaptics

struct ChallengeDoneView: View {
    @ObservedObject var viewModel: ChallengeViewModel
    @State var engine: CHHapticEngine?
    
    var body: some View {
        ZStack(alignment: .top) {
            
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
            }
            HStack{
                Button {
                    viewModel.showDone = false
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(Color.black)
                        .padding()
                }
                Spacer()
            }
        }.onAppear {
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

//struct ChallengeDoneView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChallengeDoneView(viewModel: .constant(ChallengeViewModel()))
//    }
//}
