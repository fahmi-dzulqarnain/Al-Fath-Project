//
//  OnBoardingViewModel.swift
//  Al-Fath Project
//
//  Created by Muhammad Firdaus on 17/11/21.
//

import Foundation

class OnBoardingViewModel: ObservableObject  {
    @Published var dataLearn: [LearnModel] = []
    @Published var isFinishLock: Bool = true
    
    init() {
        fetchDataJourney()
    }
    
    func fetchDataJourney() {
        dataLearn = [
            LearnModel(isLock: false, isCheckpoint: false, points: 1, title: "ا"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "ب"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "ت"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "ث"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "ج"),
            LearnModel(isLock: true, isCheckpoint: true, points: 1, title: "Checkpoint1"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "ح"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "خ"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "د"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "ذ"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "ر"),
            LearnModel(isLock: true, isCheckpoint: true, points: 1, title: "Checkpoint2"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "ز"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "س"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "ش"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "ص"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "ض"),
            LearnModel(isLock: true, isCheckpoint: true, points: 1, title: "Checkpoint3"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "ط"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "ظ"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "ع"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "غ"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "ف"),
            LearnModel(isLock: true, isCheckpoint: true, points: 1, title: "Checkpoint4"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "ق"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "ك"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "ل"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "م"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "ن"),
            LearnModel(isLock: true, isCheckpoint: true, points: 1, title: "Checkpoint5"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "ه"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "و"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "ي"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "ة")
        ]
    }
}
