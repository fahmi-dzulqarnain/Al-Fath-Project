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
    @State private var comingFromUIKitVC = ""
    

    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                CameraView(bindedValue: $comingFromUIKitVC) {
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
                Text("\(comingFromUIKitVC)")
                    .foregroundColor(.text)
                    .bold()
                    .font(.system(size: 24))
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
