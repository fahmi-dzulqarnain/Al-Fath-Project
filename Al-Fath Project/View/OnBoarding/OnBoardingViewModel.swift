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
            LearnModel(id: 1,isLock: false, isCheckpoint: false, points: 1, title: "ا", latin: "alif"),
            LearnModel(id: 2,isLock: true, isCheckpoint: false, points: 1, title: "ب", latin: "ba"),
            LearnModel(id: 3,isLock: true, isCheckpoint: false, points: 1, title: "ت", latin: "ta"),
            LearnModel(id: 4,isLock: true, isCheckpoint: false, points: 1, title: "ث", latin: "tsa"),
            LearnModel(id: 5,isLock: true, isCheckpoint: false, points: 1, title: "ج", latin: "jim"),
            LearnModel(id: 6,isLock: true, isCheckpoint: true, points: 1, title: "Checkpoint1", latin: ""),
            LearnModel(id: 7,isLock: true, isCheckpoint: false, points: 1, title: "ح", latin: ""),
            LearnModel(id: 8,isLock: true, isCheckpoint: false, points: 1, title: "خ", latin: ""),
            LearnModel(id: 9,isLock: true, isCheckpoint: false, points: 1, title: "د", latin: ""),
            LearnModel(id: 10,isLock: true, isCheckpoint: false, points: 1, title: "ذ", latin: ""),
            LearnModel(id: 11,isLock: true, isCheckpoint: false, points: 1, title: "ر", latin: ""),
            LearnModel(id: 12,isLock: true, isCheckpoint: true, points: 1, title: "Checkpoint2", latin: ""),
            LearnModel(id: 13,isLock: true, isCheckpoint: false, points: 1, title: "ز", latin: ""),
            LearnModel(id: 14,isLock: true, isCheckpoint: false, points: 1, title: "س", latin: ""),
            LearnModel(id: 15,isLock: true, isCheckpoint: false, points: 1, title: "ش", latin: ""),
            LearnModel(id: 16,isLock: true, isCheckpoint: false, points: 1, title: "ص", latin: ""),
            LearnModel(id: 17,isLock: true, isCheckpoint: false, points: 1, title: "ض", latin: ""),
            LearnModel(id: 18,isLock: true, isCheckpoint: true, points: 1, title: "Checkpoint3", latin: ""),
            LearnModel(id: 19,isLock: true, isCheckpoint: false, points: 1, title: "ط", latin: ""),
            LearnModel(id: 20,isLock: true, isCheckpoint: false, points: 1, title: "ظ", latin: ""),
            LearnModel(id: 21,isLock: true, isCheckpoint: false, points: 1, title: "ع", latin: ""),
            LearnModel(id: 22,isLock: true, isCheckpoint: false, points: 1, title: "غ", latin: ""),
            LearnModel(id: 23,isLock: true, isCheckpoint: false, points: 1, title: "ف", latin: ""),
            LearnModel(id: 24,isLock: true, isCheckpoint: true, points: 1, title: "Checkpoint4", latin: ""),
            LearnModel(id: 25,isLock: true, isCheckpoint: false, points: 1, title: "ق", latin: ""),
            LearnModel(id: 26,isLock: true, isCheckpoint: false, points: 1, title: "ك", latin: ""),
            LearnModel(id: 27,isLock: true, isCheckpoint: false, points: 1, title: "ل", latin: ""),
            LearnModel(id: 28,isLock: true, isCheckpoint: false, points: 1, title: "م", latin: ""),
            LearnModel(id: 29,isLock: true, isCheckpoint: false, points: 1, title: "ن", latin: ""),
            LearnModel(id: 30,isLock: true, isCheckpoint: true, points: 1, title: "Checkpoint5", latin: ""),
            LearnModel(id: 31,isLock: true, isCheckpoint: false, points: 1, title: "ه", latin: ""),
            LearnModel(id: 32,isLock: true, isCheckpoint: false, points: 1, title: "و", latin: ""),
            LearnModel(id: 33,isLock: true, isCheckpoint: false, points: 1, title: "ي", latin: ""),
            LearnModel(id: 34,isLock: true, isCheckpoint: false, points: 1, title: "ة", latin: "")
        ]
    }
}
