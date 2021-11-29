//
//  CameraView.swift
//  Al-Fath Project
//
//  Created by Miftahul Jihad on 10/11/21.
//

import SwiftUI

struct CameraView: UIViewControllerRepresentable {
    
    let bindedValue: String
    let onTrue: ()-> Void
    var pointsProcessorHandler: (([CGPoint]) -> Void)?
    
    func makeUIViewController(context: Context) -> CameraViewController {
        let vc = CameraViewController()
        vc.customDelegate = context.coordinator
        vc.pointsProcessorHandler = pointsProcessorHandler
        return vc
    }
    
    func updateUIViewController(_ vc: CameraViewController, context: Context) {
        print("the bindedValue: \(bindedValue)")
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
               if parent.bindedValue == value{
                   self.parent.onTrue()
               }
           }
       }
}
