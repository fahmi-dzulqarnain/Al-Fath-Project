//
//  ChallengeDoneView.swift
//  Al-Fath Project
//
//  Created by Rio Sudarsono on 04/11/21.
//

import SwiftUI

struct ChallengeDoneView: View {
    @ObservedObject var viewModel: ChallengeViewModel
    
    var body: some View {
        ZStack(alignment: .top) {
            
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
            }
            HStack{
                Button {
                    viewModel.showDone = false
                } label: {
                    Image("ic_close")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .padding()
                }
                Spacer()
            }
        }
    }
}

//struct ChallengeDoneView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChallengeDoneView(viewModel: .constant(ChallengeViewModel()))
//    }
//}
