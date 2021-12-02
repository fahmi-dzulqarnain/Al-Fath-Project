//
//  CameraViewController.swift
//  Al-Fath Project
//
//  Created by Miftahul Jihad on 10/11/21.
//


import UIKit
import AVFoundation
import Vision

protocol CustomDelegate {
    func didUpdateWithValue(_ value: String)
}


final class CameraViewController: UIViewController {
    
    var customDelegate: CustomDelegate?
    
    var numbers: [String] = ["Background"]
    
    private var cameraView: CameraPreview { view as! CameraPreview }
    
    private let videoDataOutputQueue = DispatchQueue(
        label: "CameraFeedOutput",
        qos: .userInteractive
    )
    private var cameraFeedSession: AVCaptureSession?
    private let handPoseRequest: VNDetectHumanHandPoseRequest = {
        let request = VNDetectHumanHandPoseRequest()
        request.maximumHandCount = 1
        request.revision = VNDetectHumanHandPoseRequestRevision1
        return request
    }()
    
    var pointsProcessorHandler: (([CGPoint]) -> Void)?
    
    // Core ML model
    private let model: HP_ModelV9 = {
        do {
            let config = MLModelConfiguration()
            return try HP_ModelV9(configuration: config)
        } catch {
            print(error)
            fatalError("Couldn't create SleepCalculator")
        }
    }()
    
    override func loadView() {
        view = CameraPreview()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        do {
            if cameraFeedSession == nil {
                try setupAVSession()
                cameraView.previewLayer.session = cameraFeedSession
                cameraView.previewLayer.videoGravity = .resizeAspectFill
            }
            cameraFeedSession?.startRunning()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        cameraFeedSession?.stopRunning()
        super.viewWillDisappear(animated)
    }
    
    func setupAVSession() throws {
        // Select a front facing camera, make an input.
        guard let videoDevice = AVCaptureDevice.default(
            .builtInWideAngleCamera,
            for: .video,
            position: .front)
        else {
            throw AppError.captureSessionSetup(
                reason: "Could not find a front facing camera."
            )
        }
        
        guard let deviceInput = try? AVCaptureDeviceInput(
            device: videoDevice
        ) else {
            throw AppError.captureSessionSetup(
                reason: "Could not create video device input."
            )
        }
        
        let session = AVCaptureSession()
        session.beginConfiguration()
        session.sessionPreset = AVCaptureSession.Preset.high
        
        // Add a video input.
        guard session.canAddInput(deviceInput) else {
            throw AppError.captureSessionSetup(
                reason: "Could not add video device input to the session"
            )
        }
        session.addInput(deviceInput)
        
        let dataOutput = AVCaptureVideoDataOutput()
        if session.canAddOutput(dataOutput) {
            session.addOutput(dataOutput)
            // Add a video data output.
            dataOutput.alwaysDiscardsLateVideoFrames = true
            dataOutput.setSampleBufferDelegate(self, queue: videoDataOutputQueue)
        } else {
            throw AppError.captureSessionSetup(
                reason: "Could not add video data output to the session"
            )
        }
        session.commitConfiguration()
        cameraFeedSession = session
    }
    
    func processPoints(_ fingerTips: [CGPoint]) {
        // Convert points from AVFoundation coordinates to UIKit coordinates.
        let convertedPoints = fingerTips.map {
            cameraView.previewLayer.layerPointConverted(fromCaptureDevicePoint: $0)
        }
        pointsProcessorHandler?(convertedPoints)
    }
}

extension CameraViewController: AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(
        _ output: AVCaptureOutput,
        didOutput sampleBuffer: CMSampleBuffer,
        from connection: AVCaptureConnection
    ) {
        var fingerTips: [CGPoint] = []
        
        defer {
            DispatchQueue.main.sync {
                self.processPoints(fingerTips)
            }
        }
        
        let handler = VNImageRequestHandler(
            cmSampleBuffer: sampleBuffer,
            options: [:]
        )
        do {
            // Perform VNDetectHumanHandPoseRequest
            try handler.perform([handPoseRequest])
            
            // Continue only when at least a hand was detected in the frame. We're interested in maximum of two hands.
            guard
                let results = handPoseRequest.results,
                !results.isEmpty
            else {
                return
            }
            
            let handObservation = results.first
            
            var recognizedPoints: [VNRecognizedPoint] = []
            
            try results.forEach { observation in
                // Get points for all fingers.
                let fingers = try observation.recognizedPoints(.all)
                
                // Look for tip points.
                if let thumbTipPoint = fingers[.thumbTip] {
                    recognizedPoints.append(thumbTipPoint)
                }
                if let indexTipPoint = fingers[.indexTip] {
                    recognizedPoints.append(indexTipPoint)
                }
                if let middleTipPoint = fingers[.middleTip] {
                    recognizedPoints.append(middleTipPoint)
                }
                if let ringTipPoint = fingers[.ringTip] {
                    recognizedPoints.append(ringTipPoint)
                }
                if let littleTipPoint = fingers[.littleTip] {
                    recognizedPoints.append(littleTipPoint)
                }
            }
            
            guard let keyPoinMultiArray = try? handObservation?.keypointsMultiArray() else { fatalError()}
            
            let output = try self.model.prediction(poses: keyPoinMultiArray)
            let confidence = output.labelProbabilities[output.label]!
            
            if confidence > 0.9 {
                print("Hasil prediksi: \(output.label)")
                if (numbers.first == output.label) {
                    numbers.append(output.label)
                    // TO DO prediksi benar 10 kali dalam list number maka benar.
                    if (numbers.count >= 10) {
                        self.customDelegate?.didUpdateWithValue(output.label)
                    }
                } else {
                    numbers.removeAll()
                    numbers.append(output.label)
                }
            }
            
            
            
        } catch {
            cameraFeedSession?.stopRunning()
            print(error.localizedDescription)
        }
    }
}
