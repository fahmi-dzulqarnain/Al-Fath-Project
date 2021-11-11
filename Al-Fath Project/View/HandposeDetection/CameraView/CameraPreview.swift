//
//  CameraPreview.swift
//  Al-Fath Project
//
//  Created by Miftahul Jihad on 10/11/21.
//

import UIKit
import AVFoundation

final class CameraPreview: UIView {
  var previewLayer: AVCaptureVideoPreviewLayer {
    // swiftlint:disable:next force_cast
    layer as! AVCaptureVideoPreviewLayer
  }

  override class var layerClass: AnyClass {
    AVCaptureVideoPreviewLayer.self
  }
}
