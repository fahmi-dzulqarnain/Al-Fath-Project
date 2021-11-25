//
//  ProgressBarView.swift
//  Al-Fath Project
//
//  Created by Rio Sudarsono on 15/11/21.
//

import SwiftUI

struct ProgressBarView: View {
    var percent: CGFloat = 70
    
    var body: some View {
        let multiplier = (UIScreen.main.bounds.width - 32) / 100
        
        VStack {
            ZStack(alignment: .leading){
                RoundedRectangle(cornerRadius: 60, style: .continuous)
                    .frame(height: 15)
                    .foregroundColor(.text)
                RoundedRectangle(cornerRadius: 60, style: .continuous)
                    .frame(width: percent * multiplier, height: 15, alignment: .leading)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color.blue]), startPoint: .leading, endPoint: .trailing)
                            .clipShape(RoundedRectangle(cornerRadius: 60, style: .continuous)))
                    .foregroundColor(.clear)
                HStack{
                    Spacer()
                    Circle()
                        .fill(Color.white)
                        .frame(width: 6, height: 6)
                    Spacer()
                    Circle()
                        .fill(Color.white)
                        .frame(width: 6, height: 6)
                    Spacer()
                }
            }
            HStack{
                Spacer()
                ZStack(alignment: .center){
                    Text("Huruf")
                        .font(.system(size: 12))
                }.frame(width: 100)
                Spacer()
                ZStack(alignment: .center){
                    Text("Kata")
                        .font(.system(size: 12))
                }.frame(width: 100)
                Spacer()
                ZStack(alignment: .center){
                    Text("Pencocokan")
                        .font(.system(size: 12))
                }.frame(width: 100)
                Spacer()
            }
        }
        
    }
}

struct ProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarView()
    }
}
