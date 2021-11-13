//
//  CameraView.swift
//  Al-Fath Project
//
//  Created by Miftahul Jihad on 10/11/21.
//

import SwiftUI

struct CameraView: UIViewControllerRepresentable {
    
    @Binding var bindedValue: String
    var pointsProcessorHandler: (([CGPoint]) -> Void)?
    
    func makeUIViewController(context: Context) -> CameraViewController {
        let vc = CameraViewController()
        vc.customDelegate = context.coordinator
        vc.pointsProcessorHandler = pointsProcessorHandler
        return vc
    }
    
    func updateUIViewController(_ vc: CameraViewController, context: Context) {
        print("the bindedValue updated: \(bindedValue)")
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(customView: self)
    }
    
    class Coordinator: NSObject, CustomDelegate {
           var parent: CameraView

           init(customView: CameraView) {
               self.parent = customView
           }

           func didUpdateWithValue(_ value: String) {
               parent.bindedValue = value
           }
       }
}
