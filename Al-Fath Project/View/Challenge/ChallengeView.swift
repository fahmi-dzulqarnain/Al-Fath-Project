//
//  ChallengeView.swift
//  Al-Fath Project
//
//  Created by Rio Sudarsono on 14/10/21.
//

import SwiftUI

struct ChallengeView: View {
    
    @ObservedObject var viewModel = ChallengeViewModel()
    
    func getIconName() -> Image {
        return Image(systemName: "house.fill")
    }
    
    func gettabName() -> Text {
        return Text("Challenge")
    }
    
    var body: some View {
        VStack {
            menu
            menu
            NavigationLink(destination: Challenge3View(viewModel: viewModel)){
                menu
            }
        }
    }
    
    var menu: some View {
        HStack {
            Spacer()
            VStack {
                Image(systemName: "cloud.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                Text("text")
                    .bold()
                    .font(.system(size: 14))
                    .foregroundColor(Color("ColorText"))
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            Spacer()
        }
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.2), radius: 5, x: 2, y: 2)
        .padding(.horizontal)
        .padding(.vertical, 4)
        .onAppear(perform: {
            viewModel.randomQuiz()
        })
    }
}

struct ChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeView()
    }
}
