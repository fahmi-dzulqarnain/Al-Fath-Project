//
//  Challenge3View.swift
//  Al-Fath Project
//
//  Created by Rio Sudarsono on 03/11/21.
//

import SwiftUI

struct Challenge3View: View {
    
    var data: [GamesModel] = [
        GamesModel(name: "Alif", code: 1, isChoose: false, isHidden: false),
        GamesModel(name: "Ba", code: 1, isChoose: false, isHidden: false),
        GamesModel(name: "Ta", code: 1, isChoose: false, isHidden: false),
        GamesModel(name: "Sa", code: 1, isChoose: false, isHidden: false),
        GamesModel(name: "Ja", code: 1, isChoose: false, isHidden: false),
        GamesModel(name: "Za", code: 1, isChoose: false, isHidden: false),]
    
    var items: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        ZStack {
            LazyVGrid(columns: items, spacing: 10) {
                ForEach(0..<data.count) { index in
                    HStack {
                        Spacer()
                        VStack {
                            Text(data[index].name)
                                .foregroundColor(.gray)
                                .bold()
                                .font(.system(size: 14))
                                .foregroundColor(Color("ColorText"))
                        }
                        .padding(.vertical, 48)
                        Spacer()
                    }
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.2), radius: 5, x: 2, y: 2)
                    .padding(.horizontal, 30)
                    .padding(.vertical, 8)
                }
            }
        }
        .padding(.horizontal, 24)
    }
}

struct Challenge3View_Previews: PreviewProvider {
    static var previews: some View {
        Challenge3View()
    }
}
