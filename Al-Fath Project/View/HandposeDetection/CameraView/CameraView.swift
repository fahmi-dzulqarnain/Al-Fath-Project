//
//  CameraView.swift
//  Al-Fath Project
//
//  Created by Miftahul Jihad on 10/11/21.
//

import SwiftUI

struct CameraView: UIViewControllerRepresentable {
  var pointsProcessorHandler: (([CGPoint]) -> Void)?

  func makeUIViewController(context: Context) -> CameraViewController {
    let cvc = CameraViewController()
    cvc.pointsProcessorHandler = pointsProcessorHandler
    return cvc
  }

  func updateUIViewController(
    _ uiViewController: CameraViewController,
    context: Context
  ) {
  }
}
