//
//  DictionaryViewModel.swift
//  Al-Fath Project
//
//  Created by Fahmi Dzulqarnain on 16/11/21.
//

import Foundation
import AVFoundation

class DictionaryListViewModel: ObservableObject {
    
    @Published var showDictionary: Bool = false
    @Published var dictionaryData = DictionaryData(letter: "", latin: "", videoName: "", code: 0)
    @Published var player = AVPlayer()
    let datas = [
        DictionaryData(letter: "ا", latin: "Alif", videoName: "alif", code: 1),
        DictionaryData(letter: "ب", latin: "Ba", videoName: "ba", code: 2),
        DictionaryData(letter: "ت", latin: "Ta", videoName: "ta", code: 3),
        DictionaryData(letter: "ث", latin: "Tsa", videoName: "tsa", code: 4),
        DictionaryData(letter: "ج", latin: "Jim", videoName: "jim", code: 5),
        DictionaryData(letter: "ح", latin: "Ha", videoName: "ha", code: 6),
        DictionaryData(letter: "خ", latin: "Kha", videoName: "kha", code: 7),
        DictionaryData(letter: "د", latin: "Dal", videoName: "dal", code: 8),
        DictionaryData(letter: "ذ", latin: "Dzal", videoName: "dzal", code: 9),
        DictionaryData(letter: "ر", latin: "Ra", videoName: "ra", code: 10),
        DictionaryData(letter: "ز", latin: "Za", videoName: "zay", code: 11),
        DictionaryData(letter: "س", latin: "Sin", videoName: "sin", code: 12),
        DictionaryData(letter: "ش", latin: "Syin", videoName: "syin", code: 13),
        DictionaryData(letter: "ص", latin: "Shad", videoName: "shad", code: 14),
        DictionaryData(letter: "ض", latin: "Dha", videoName: "dhod", code: 15),
        DictionaryData(letter: "ط", latin: "Tha", videoName: "tho", code: 16),
        DictionaryData(letter: "ظ", latin: "Zha", videoName: "Zha", code: 17),
        DictionaryData(letter: "ع", latin: "Ain", videoName: "ain", code: 18),
        DictionaryData(letter: "غ", latin: "Ghain", videoName: "ghoin", code: 19),
        DictionaryData(letter: "ف", latin: "Fa", videoName: "fa", code: 20),
        DictionaryData(letter: "ق", latin: "Qaf", videoName: "qof", code: 21),
        DictionaryData(letter: "ك", latin: "Kaf", videoName: "kaf", code: 22),
        DictionaryData(letter: "ل", latin: "Lam", videoName: "lam", code: 23),
        DictionaryData(letter: "م", latin: "Mim", videoName: "mim", code: 24),
        DictionaryData(letter: "ن", latin: "Nun", videoName: "nun", code: 25),
        DictionaryData(letter: "و", latin: "Waw", videoName: "waw", code: 26),
        DictionaryData(letter: "هـ", latin: "Ha", videoName: "ha", code: 27),
        DictionaryData(letter: "ي", latin: "Ya", videoName: "ya", code: 28),
        DictionaryData(letter: "ة", latin: "Ta", videoName: "ta", code: 29),
    ]
    
}
