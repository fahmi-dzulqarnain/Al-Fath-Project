//
//  Learn2View.swift
//  Al-Fath Project
//
//  Created by Rio Sudarsono on 10/11/21.
//

import SwiftUI

struct Learn2View: View {
    @State private var overlayPoints: [CGPoint] = []
    @State private var huruf: String = ""
    @StateObject var sharedVM: SharedViewModel = SharedViewModel()
    

    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                CameraView(sharedVM: sharedVM) {
                    overlayPoints = $0;
                }
                Spacer()
                HStack(alignment: .bottom){
                    Image("img_cactus1")
                    Image("img_cactus2")
                    Image("img_cactus3")
                }
                
            }
            
            
            VStack {
                Text("\(sharedVM.labelHurufPredict)")
                    .foregroundColor(.text)
                    .bold()
                    .font(.system(size: 72))
                Text("")
                    .foregroundColor(.text)
                    .bold()
                    .font(.system(size: 72))

            }
            .padding(.horizontal)
            .padding(.bottom, 48)
            
        }
    }
}

struct Learn2View_Previews: PreviewProvider {
    static var previews: some View {
        Learn2View()
    }
}
