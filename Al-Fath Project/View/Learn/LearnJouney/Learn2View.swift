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
    @State var isShow = false

    var body: some View {
        ZStack(alignment: .bottom) {
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
                    .padding()
                Spacer()
                HStack(alignment: .bottom){
                    Image("img_cactus1")
                    Spacer()
                    Image("img_cactus3")
                    Image("img_cactus2")
                    
                }.padding(.horizontal)
                
            }
            
            HStack {
                Spacer()
                Image("ic_checklist")
                    .resizable()
                    .frame(width: 36, height: 36)
                    .padding(.all, 30)
                    .background(Color.secondary)
                    .cornerRadius(99)
                    .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.2), radius: 5, x: 2, y: 2)
                    .onTapGesture {
                        isShow.toggle()
                    }
            }
            .padding(.horizontal)
            .padding(.bottom, 48)
            
            CorrectView(isShow: $isShow)
            
        }
        .background(Color.third)
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarTitle("Latihan", displayMode: .inline)
    }
    
}

struct Learn2View_Previews: PreviewProvider {
    static var previews: some View {
        Learn2View()
    }
}
