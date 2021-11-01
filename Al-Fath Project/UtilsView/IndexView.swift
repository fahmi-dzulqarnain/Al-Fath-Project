//
//  IndexView.swift
//  Al-Fath Project
//
//  Created by Rio Sudarsono on 28/10/21.
//

import SwiftUI

struct IndexView: View {
    var numberOfPages: Int
    @Binding var currentIndex: Int
    
    
    private let circleSize: CGFloat = 16
    private let circleSpacing: CGFloat = 12
    
    private let primaryColor = Color.black
    private let secondaryColor = Color.gray.opacity(0.6)
    
    private let smallScale: CGFloat = 0.6
    
    var body: some View {
      HStack(spacing: 4) {
        ForEach(0..<numberOfPages) { index in
          Circle()
              .fill(currentIndex == index ? primaryColor : secondaryColor)
              .scaleEffect(smallScale)
              .frame(width: circleSize, height: circleSize)
          
        }
      }
    }
}

struct IndexView_Previews: PreviewProvider {
    static var previews: some View {
        IndexView(numberOfPages: 5, currentIndex: .constant(0))
    }
}
