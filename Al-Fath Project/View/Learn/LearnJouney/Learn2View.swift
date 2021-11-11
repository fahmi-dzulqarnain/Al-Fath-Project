//
//  Learn2View.swift
//  Al-Fath Project
//
//  Created by Rio Sudarsono on 10/11/21.
//

import SwiftUI

struct Learn2View: View {
    @State private var overlayPoints: [CGPoint] = []
    
    var body: some View {
        ZStack {
          CameraView {
            overlayPoints = $0
          }

        }
    }
}

struct Learn2View_Previews: PreviewProvider {
    static var previews: some View {
        Learn2View()
    }
}
