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

let colorsGradient = [
    LinearGradient(gradient: Gradient(colors: [Color(red: 0.95, green: 0.47, blue: 0.42), Color(red: 0.80, green: 0.34, blue: 0.26)]), startPoint: .topLeading, endPoint: .bottom),
    LinearGradient(gradient: Gradient(colors: [Color(red: 0.31, green: 0.87, blue: 0.42), Color(red: 0.35, green: 0.64, blue: 0.40)]), startPoint: .topLeading, endPoint: .bottom),
    LinearGradient(gradient: Gradient(colors: [Color(red: 0.17, green: 0.77, blue: 0.96), Color(red: 0.17, green: 0.59, blue: 0.84)]), startPoint: .topLeading, endPoint: .bottom),
    LinearGradient(gradient: Gradient(colors: [Color(red: 0.99, green: 0.85, blue: 0.35), Color(red: 0.89, green: 0.58, blue: 0.05)]), startPoint: .topLeading, endPoint: .bottom),
    LinearGradient(gradient: Gradient(colors: [Color(red: 0.72, green: 0.49, blue: 0.90), Color(red: 0.57, green: 0.24, blue: 0.94)]), startPoint: .topLeading, endPoint: .bottom),
    LinearGradient(gradient: Gradient(colors: [Color(red: 0.95, green: 0.47, blue: 0.42), Color(red: 0.80, green: 0.34, blue: 0.26)]), startPoint: .topLeading, endPoint: .bottom)
]

struct DictionaryListView: View {
    
    @ObservedObject var vm: DictionaryListViewModel
    @State private var animationAmount = 1.0
    
    let gridItems: [GridItem] = [
        GridItem(.flexible(), spacing: -50),
        GridItem(.flexible(), spacing: -50)
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: gridItems) {
                ForEach (Array(vm.datas.enumerated()), id: \.offset) {index, data in
                    ButtonDictionary(vm: vm, data: data, bgColor: selectButtonColor(index: index))
                }
            }
            .padding(.top, 60)
            .environment(\.layoutDirection, .rightToLeft)
        }
        .padding(.bottom, 80)
        .background(Color.greenLight)
        .edgesIgnoringSafeArea(.top)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    func selectButtonColor(index: Int) -> LinearGradient {
        let currentIndex = index + 1
        if ((currentIndex % 6) == 0) {
            return colorsGradient[5]
            }
            else if ((currentIndex % 5) == 0) {
                return colorsGradient[4]
                }
            else if ((currentIndex % 4) == 0) {
                return colorsGradient[3]
                }
            else if ((currentIndex % 3) == 0) {
                return colorsGradient[2]
                }
            else if ((currentIndex % 2) == 0) {
                return colorsGradient[1]
                }
            else if ((currentIndex % 1) == 0) {
                return colorsGradient[0]
                }
            else {
                return colorsGradient[0]
            }
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
    var bgColor: LinearGradient
    
    var body: some View {
        Button(action: {
            vm.showDictionary = true
            vm.dictionaryData = data
            Global.videoName = data.videoName
        }) {
            Text(data.letter)
                .font(Font.custom(Constans.textArab, size: 36).bold())
                .frame(width: 112, height: 112,alignment: .center)
                .foregroundColor(.white)
                .background(
                    bgColor
                )
                .clipShape(Circle())
            
        }
        .padding(.bottom, 50)
    }
}
