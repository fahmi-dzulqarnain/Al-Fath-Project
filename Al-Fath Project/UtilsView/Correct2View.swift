//
//  Correct2View.swift
//  Al-Fath Project
//
//  Created by Rio Sudarsono on 30/11/21.
//

import SwiftUI
import CoreHaptics

struct Correct2View: View {
    @Binding var isShow: Bool
    @Binding var isNext: Bool
    let onNext: ()-> Void
    let onTap: ()-> Void
    @State var engine: CHHapticEngine?
    
    var body: some View {
        VStack{
            Spacer()
            VStack{
                Spacer()
                Image("ic_trophy")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .padding()
                Text("Alhamdulillah Kamu bisa!")
                    .bold()
                    .font(.system(size: 20))
                    .foregroundColor(.text)
                Spacer()
                HStack {
                    Spacer()
                    if isNext {
                        Image(systemName: "chevron.right.circle.fill")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .foregroundColor(.colorGreen)
                            .padding(.all, 36)
                            .onTapGesture {
                                self.onNext()
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
            self.onTap()
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

//struct Correct2View_Previews: PreviewProvider {
//    static var previews: some View {
//        Correct2View(isShow: .constant(true))
//    }
//}
