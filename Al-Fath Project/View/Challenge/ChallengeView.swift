//
//  ChallengeView.swift
//  Al-Fath Project
//
//  Created by Rio Sudarsono on 14/10/21.
//

import SwiftUI

struct ChallengeView: View {
    
    func getIconName() -> Image {
        return Image(systemName: "house.fill")
    }
    
    func gettabName() -> Text {
        return Text("Challenge")
    }
    
    var body: some View {
        gettabName()
    }
}

struct ChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeView()
    }
}
