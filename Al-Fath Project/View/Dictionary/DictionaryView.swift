//
//  DictionaryView.swift
//  Al-Fath Project
//
//  Created by Fahmi Dzulqarnain on 16/11/21.
//

import SwiftUI

struct DictionaryData {
    let id = UUID()
    let letter: String
}

struct DictionaryView: View {
    
    let datas = [
        DictionaryData(letter: "ب"),
        DictionaryData(letter: "ا"),
        DictionaryData(letter: "ت")
    ]
    
    let gridItems: [GridItem] = [
        GridItem(.adaptive(minimum: 110))
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: gridItems) {
                ForEach (datas, id: \.id) {data in
                    Text(data.letter).foregroundColor(Color.primary)
                }
            }
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.top)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        
    }
}

struct DictionaryView_Previews: PreviewProvider {
    static var previews: some View {
        DictionaryView()
    }
}
