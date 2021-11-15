//
//  HurufView.swift
//  Al-Fath Project
//
//  Created by Rio Sudarsono on 15/11/21.
//

import SwiftUI

struct HurufView: View {
    @Binding var selected: Int
    @Binding var progress: CGFloat
    @State private var overlayPoints: [CGPoint] = []
    @State private var comingFromUIKitVC = ""
    @State var isShow = false
    
    var body: some View {
        ZStack{
            VStack {
                ZStack(alignment: .topTrailing){
                    CameraView(bindedValue: $comingFromUIKitVC) {
                        overlayPoints = $0;
                    }
                    Image("ic_camera")
                        .resizable()
                        .frame(width: 48, height: 36)
                        .padding()
                }
                Text("ب")
                    .foregroundColor(.text)
                    .bold()
                    .font(.system(size: 72))
                    .onTapGesture {
                        selected = 1
                        progress = 66
                    }
            }
            CorrectView(isShow: $isShow)
        }
        .padding(.bottom, 32)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .background(Color.primary)
        .edgesIgnoringSafeArea(.vertical)
        
    }
}

//struct HurufView_Previews: PreviewProvider {
//    static var previews: some View {
//        HurufView()
//    }
//}
