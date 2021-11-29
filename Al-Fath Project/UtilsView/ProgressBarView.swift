//
//  ProgressBarView.swift
//  Al-Fath Project
//
//  Created by Rio Sudarsono on 15/11/21.
//

import SwiftUI

struct ProgressBarView: View {
    var percent: CGFloat = 70
    var pos = 1
    
    var body: some View {
        let multiplier = (UIScreen.main.bounds.width - 32) / 100
        
        VStack {
            
            HStack{
                Spacer()
                ZStack(alignment: .center){
                    Image("img_check1")
                        .resizable()
                        .frame(width: 24, height: 20)
                        .foregroundColor(pos == 0 ? .white : .greyLight)
                }.frame(width: 100)
                Spacer()
                ZStack(alignment: .center){
                    if pos > 1 {
                        Image("img_check2_")
                            .resizable()
                            .frame(width: 24, height: 20)
                    } else {
                        Image("img_check2")
                            .resizable()
                            .frame(width: 24, height: 20)
                    }
                    
                }.frame(width: 100)
                Spacer()
                ZStack(alignment: .center){
                    if pos > 2 {
                        Image("img_check3_")
                            .resizable()
                            .frame(width: 24, height: 20)
                    } else {
                        Image("img_check3")
                            .resizable()
                            .frame(width: 24, height: 20)
                    }
                }.frame(width: 100)
                Spacer()
            }
            .padding(.bottom, 2)
            
            ZStack(alignment: .leading){
                RoundedRectangle(cornerRadius: 60, style: .continuous)
                    .frame(height: 15)
                    .foregroundColor(.greyLight)
                RoundedRectangle(cornerRadius: 60, style: .continuous)
                    .frame(width: percent * multiplier, height: 15, alignment: .leading)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color.gold]), startPoint: .leading, endPoint: .trailing)
                            .clipShape(RoundedRectangle(cornerRadius: 60, style: .continuous)))
                    .foregroundColor(.clear)
                HStack{
                    Spacer()
                    Circle()
                        .fill(.white)
                        .frame(width: 6, height: 6)
                    Spacer()
                    Circle()
                        .fill(.white)
                        .frame(width: 6, height: 6)
                    Spacer()
                }
            }
           
        }
        
    }
}

struct ProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarView()
    }
}
