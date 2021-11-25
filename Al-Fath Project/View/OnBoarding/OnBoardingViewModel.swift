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
            LearnModel(id: 1,isLock: false, isCheckpoint: false, points: 1, title: "ا"),
            LearnModel(id: 2,isLock: true, isCheckpoint: false, points: 1, title: "ب"),
            LearnModel(id: 3,isLock: true, isCheckpoint: false, points: 1, title: "ت"),
            LearnModel(id: 4,isLock: true, isCheckpoint: false, points: 1, title: "ث"),
            LearnModel(id: 5,isLock: true, isCheckpoint: false, points: 1, title: "ج"),
            LearnModel(id: 6,isLock: true, isCheckpoint: true, points: 1, title: "Checkpoint1"),
            LearnModel(id: 7,isLock: true, isCheckpoint: false, points: 1, title: "ح"),
            LearnModel(id: 8,isLock: true, isCheckpoint: false, points: 1, title: "خ"),
            LearnModel(id: 9,isLock: true, isCheckpoint: false, points: 1, title: "د"),
            LearnModel(id: 10,isLock: true, isCheckpoint: false, points: 1, title: "ذ"),
            LearnModel(id: 11,isLock: true, isCheckpoint: false, points: 1, title: "ر"),
            LearnModel(id: 12,isLock: true, isCheckpoint: true, points: 1, title: "Checkpoint2"),
            LearnModel(id: 13,isLock: true, isCheckpoint: false, points: 1, title: "ز"),
            LearnModel(id: 14,isLock: true, isCheckpoint: false, points: 1, title: "س"),
            LearnModel(id: 15,isLock: true, isCheckpoint: false, points: 1, title: "ش"),
            LearnModel(id: 16,isLock: true, isCheckpoint: false, points: 1, title: "ص"),
            LearnModel(id: 17,isLock: true, isCheckpoint: false, points: 1, title: "ض"),
            LearnModel(id: 18,isLock: true, isCheckpoint: true, points: 1, title: "Checkpoint3"),
            LearnModel(id: 19,isLock: true, isCheckpoint: false, points: 1, title: "ط"),
            LearnModel(id: 20,isLock: true, isCheckpoint: false, points: 1, title: "ظ"),
            LearnModel(id: 21,isLock: true, isCheckpoint: false, points: 1, title: "ع"),
            LearnModel(id: 22,isLock: true, isCheckpoint: false, points: 1, title: "غ"),
            LearnModel(id: 23,isLock: true, isCheckpoint: false, points: 1, title: "ف"),
            LearnModel(id: 24,isLock: true, isCheckpoint: true, points: 1, title: "Checkpoint4"),
            LearnModel(id: 25,isLock: true, isCheckpoint: false, points: 1, title: "ق"),
            LearnModel(id: 26,isLock: true, isCheckpoint: false, points: 1, title: "ك"),
            LearnModel(id: 27,isLock: true, isCheckpoint: false, points: 1, title: "ل"),
            LearnModel(id: 28,isLock: true, isCheckpoint: false, points: 1, title: "م"),
            LearnModel(id: 29,isLock: true, isCheckpoint: false, points: 1, title: "ن"),
            LearnModel(id: 30,isLock: true, isCheckpoint: true, points: 1, title: "Checkpoint5"),
            LearnModel(id: 31,isLock: true, isCheckpoint: false, points: 1, title: "ه"),
            LearnModel(id: 32,isLock: true, isCheckpoint: false, points: 1, title: "و"),
            LearnModel(id: 33,isLock: true, isCheckpoint: false, points: 1, title: "ي"),
            LearnModel(id: 34,isLock: true, isCheckpoint: false, points: 1, title: "ة")
        ]
    }
}
