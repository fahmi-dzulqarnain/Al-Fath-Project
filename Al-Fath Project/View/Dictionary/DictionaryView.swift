//
//  DictionaryView.swift
//  Al-Fath Project
//
//  Created by Rio Sudarsono on 14/10/21.
//

import SwiftUI

struct DictionaryView: View {
    
    var body: some View {
        ScrollView {
            VStack {
                HStack{
                    Spacer()
                    Text("Kamus")
                    Spacer()
                }
                
            }
        }
        .background(Color.secondary)
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
