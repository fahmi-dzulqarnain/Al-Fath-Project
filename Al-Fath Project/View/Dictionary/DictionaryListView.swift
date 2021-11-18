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
    let latin: String
    let videoName: String
    let code: Int
}

struct DictionaryListView: View {
    
    @ObservedObject var vm: DictionaryListViewModel
    @State private var animationAmount = 1.0
    
    let gridItems: [GridItem] = [
        GridItem(.adaptive(minimum: 110)),
        GridItem(.adaptive(minimum: 110))
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: gridItems) {
                ForEach (vm.datas, id: \.id) {data in
                    ButtonDictionary(vm: vm, data: data)
                }
            }
            .padding(.top, 60)
            .environment(\.layoutDirection, .rightToLeft)
        }
        .padding()
        .background(Color("ColorSecondary"))
        .edgesIgnoringSafeArea(.top)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct DictionaryListView_Previews: PreviewProvider {
    static var previews: some View {
        DictionaryListView(vm: DictionaryListViewModel())
    }
}

struct ButtonDictionary : View {
    var vm: DictionaryListViewModel
    var data: DictionaryData
    
    var body: some View {
        Button(action: {
            vm.showDictionary = true
            vm.dictionaryData = data
        }) {
            ZStack {
                Circle()
                    .foregroundColor(Color("ColorBlue"))
                    .frame(minWidth: 80, idealWidth: 110, maxWidth: 330, minHeight: 80, idealHeight: 110, maxHeight: 330, alignment: .center)
                Text(data.letter)
                    .foregroundColor(Color.white)
                    .font(.custom("ScheherazadeNew-Regular", size: 34, relativeTo: .largeTitle))
            }
        }
        .padding(.bottom, 50)
    }
}
