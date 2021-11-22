//
//  SpaceView.swift
//  Al-Fath Project
//
//  Created by Rio Sudarsono on 22/11/21.
//

import SwiftUI

struct SpaceView: View {
    var space: CGFloat
    
    var body: some View {
        HStack {
            Spacer()
        }.frame(height: space)
        .background(Color.primary)
    }
}

