//
//  LearnViewModel.swift
//  Al-Fath Project
//
//  Created by Rio Sudarsono on 09/11/21.
//

import Foundation
import CoreData

class LearnViewModel: ObservableObject {
    
    @Published var learn1Show: Bool = false
    @Published var checkPointShow: Bool = false
    @Published var dataLearn = DictionaryData(letter: "", latin: "", videoName: "", code: 0)
    @Published var nextLearn = DictionaryData(letter: "", latin: "", videoName: "", code: 0)
    @Published var dataLearn: [LearnModel] = []
    @Published var isFinishLock: Bool = true
        
    func fetchDataJourney() {
        dataLearn = [
            LearnModel(isLock: false, isCheckpoint: false, points: 1, title: "ا"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "ب"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "ت"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "ث"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "ج"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "ح"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "خ"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "د"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "ذ"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "ر"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "ز"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "س"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "ش"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "ص"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "ض"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "ط"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "ظ"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "ع"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "غ"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "ف"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "ق"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "ك"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "ل"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "م"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "ن"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "ه"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "و"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "ي"),
            LearnModel(isLock: true, isCheckpoint: false, points: 1, title: "ة")
        ]
        
        let datas = [
            DictionaryModel(letter: "ا", latin: "Alif", videoName: "alif"),
            DictionaryModel(letter: "ب", latin: "Ba", videoName: "ba"),
            DictionaryModel(letter: "ت", latin: "Ta", videoName: "ta"),
            DictionaryModel(letter: "ث", latin: "Tsa", videoName: "tsa"),
            DictionaryModel(letter: "ج", latin: "Jim", videoName: "jim"),
            DictionaryModel(letter: "ح", latin: "Ha", videoName: "ha"),
            DictionaryModel(letter: "خ", latin: "Kha", videoName: "kha"),
            DictionaryModel(letter: "د", latin: "Dal", videoName: "dal"),
            DictionaryModel(letter: "ذ", latin: "Dzal", videoName: "dzal"),
            DictionaryModel(letter: "ر", latin: "Ra", videoName: "ra"),
            DictionaryModel(letter: "ز", latin: "Za", videoName: "zay"),
            DictionaryModel(letter: "س", latin: "Sin", videoName: "sin"),
            DictionaryModel(letter: "ش", latin: "Syin", videoName: "syin"),
            DictionaryModel(letter: "ص", latin: "Shad", videoName: "shad"),
            DictionaryModel(letter: "ض", latin: "Dha", videoName: "dhod"),
            DictionaryModel(letter: "ط", latin: "Tha", videoName: "tho"),
            DictionaryModel(letter: "ظ", latin: "Zha", videoName: "Zha"),
            DictionaryModel(letter: "ع", latin: "Ain", videoName: "ain"),
            DictionaryModel(letter: "غ", latin: "Ghain", videoName: "ghoin"),
            DictionaryModel(letter: "ف", latin: "Fa", videoName: "fa"),
            DictionaryModel(letter: "ق", latin: "Qaf", videoName: "qof"),
            DictionaryModel(letter: "ك", latin: "Kaf", videoName: "kaf"),
            DictionaryModel(letter: "ل", latin: "Lam", videoName: "lam"),
            DictionaryModel(letter: "م", latin: "Mim", videoName: "mim"),
            DictionaryModel(letter: "ن", latin: "Nun", videoName: "nun"),
            DictionaryModel(letter: "و", latin: "Waw", videoName: "waw"),
            DictionaryModel(letter: "هـ", latin: "Ha", videoName: "ha"),
            DictionaryModel(letter: "ي", latin: "Ya", videoName: "ya"),
            DictionaryModel(letter: "ة", latin: "Ta", videoName: "ta"),
        ]
        
        // Add data dictionary to dataLearn
        for (index, value) in datas.enumerated() {
            dataLearn[index].dictionary = value
        }
        
        // Add CheckPoint after 5 hijaiyah to dataLearn
        for (index, _) in dataLearn.enumerated() {
            if index % 5 == 0 && index != 0 {
                dataLearn.insert(LearnModel(isLock: true, isCheckpoint: true, points: 1, title: ""), at: index)
            }
        }
    }
   
}
