//
//  KataView.swift
//  Al-Fath Project
//
//  Created by Rio Sudarsono on 15/11/21.
//

import SwiftUI

struct KataView: View {
    @Binding var selected: Int
    @Binding var progress: CGFloat
    @State private var overlayPoints: [CGPoint] = []
    @State private var comingFromUIKitVC = ""
    
    var body: some View {
        VStack{
            ZStack(alignment: .topTrailing){
                CameraView(bindedValue: $comingFromUIKitVC) {
                    overlayPoints = $0;
                }
                Image("ic_camera")
                    .resizable()
                    .frame(width: 48, height: 36)
                    .padding()
            }
            HStack{
                Text("ت")
                    .foregroundColor(.text)
                    .bold()
                    .font(.system(size: 72))
                Image("img_line")
                Text("ب")
                    .foregroundColor(.text)
                    .bold()
                    .font(.system(size: 72))
            }
            Text("بت")
                .foregroundColor(.text)
                .bold()
                .font(.system(size: 72))
                .onTapGesture {
                    selected = 2
                    progress = 100
                }
        }
        .padding(.bottom, 32)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .background(Color.primary)
        .edgesIgnoringSafeArea(.vertical)
    }
}

//struct KataView_Previews: PreviewProvider {
//    static var previews: some View {
//        KataView()
//    }
//}
