//
//  LearnViewModel.swift
//  Al-Fath Project
//
//  Created by Rio Sudarsono on 09/11/21.
//

import Foundation
import CoreData
import AVFoundation
import SwiftUI

class LearnViewModel: ObservableObject {
    
    @Published var title = ""
    @Published var learn1Show: Bool = false
    @Published var learn2Show: Bool = false
    @Published var checkPointShow: Bool = false
    @Published var dataLearn = DictionaryData(letter: "", latin: "", videoName: "", code: 0)
    @Published var nextLearn = DictionaryData(letter: "", latin: "", videoName: "", code: 0)
    @Published var isFinishLock: Bool = true
    @Published var page = 1
    
    @Published var navLearn1: Bool = false
    @Published var player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "alif", ofType: "mp4")!))
    
    func setVideo() {
        player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: dataLearn.videoName, ofType: "mp4")!))
    }
}
