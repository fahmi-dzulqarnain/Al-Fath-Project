//
//  DictionaryView.swift
//  Al-Fath Project
//
//  Created by Fahmi Dzulqarnain on 17/11/21.
//

import SwiftUI

struct DictionaryView: View {
    var vm: DictionaryListViewModel
    
    var body: some View {
        VStack {
            Spacer()
            Text("Ini adalah Kamus \(vm.dictionaryData.letter)")
                .font(.custom("MPLUSRounded1c-Regular", size: 28, relativeTo: .title))
            Divider()
            Spacer()
        }
        .background(Color("ColorPrimary"))
        .ignoresSafeArea()
    }
}

struct DictionaryView_Previews: PreviewProvider {
    static var previews: some View {
        DictionaryView(vm: DictionaryListViewModel())
    }
}
