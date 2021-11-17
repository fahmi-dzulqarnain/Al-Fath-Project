//
//  DictionaryViewModel.swift
//  Al-Fath Project
//
//  Created by Fahmi Dzulqarnain on 16/11/21.
//

import Foundation

class DictionaryListViewModel: ObservableObject {
    
    @Published var showDictionary: Bool = false
    @Published var dictionaryData = DictionaryData(letter: "", latin: "", videoName: "")
    let datas = [
        DictionaryData(letter: "ا", latin: "Alif", videoName: "alif"),
        DictionaryData(letter: "ب", latin: "Ba", videoName: "ba"),
        DictionaryData(letter: "ت", latin: "Ta", videoName: "ta"),
        DictionaryData(letter: "ث", latin: "Tsa", videoName: "tsa"),
        DictionaryData(letter: "ج", latin: "Jim", videoName: "jim"),
        DictionaryData(letter: "ح", latin: "Ha", videoName: "ha"),
        DictionaryData(letter: "خ", latin: "Kha", videoName: "kha"),
        DictionaryData(letter: "د", latin: "Dal", videoName: "dal"),
        DictionaryData(letter: "ذ", latin: "Dzal", videoName: "dzal"),
        DictionaryData(letter: "ر", latin: "Ra", videoName: "ra"),
        DictionaryData(letter: "ز", latin: "Za", videoName: "zay"),
        DictionaryData(letter: "س", latin: "Sin", videoName: "sin"),
        DictionaryData(letter: "ش", latin: "Syin", videoName: "syin"),
        DictionaryData(letter: "ص", latin: "Shad", videoName: "shad"),
        DictionaryData(letter: "ض", latin: "Dha", videoName: "dhod"),
        DictionaryData(letter: "ط", latin: "Tha", videoName: "tho"),
        DictionaryData(letter: "ظ", latin: "Zha", videoName: "Zha"),
        DictionaryData(letter: "ع", latin: "Ain", videoName: "ain"),
        DictionaryData(letter: "غ", latin: "Ghain", videoName: "ghoin"),
        DictionaryData(letter: "ف", latin: "Fa", videoName: "fa"),
        DictionaryData(letter: "ق", latin: "Qaf", videoName: "qof"),
        DictionaryData(letter: "ك", latin: "Kaf", videoName: "kaf"),
        DictionaryData(letter: "ل", latin: "Lam", videoName: "lam"),
        DictionaryData(letter: "م", latin: "Mim", videoName: "mim"),
        DictionaryData(letter: "ن", latin: "Nun", videoName: "nun"),
        DictionaryData(letter: "و", latin: "Waw", videoName: "waw"),
        DictionaryData(letter: "هـ", latin: "Ha", videoName: "ha"),
        DictionaryData(letter: "ي", latin: "Ya", videoName: "ya"),
        DictionaryData(letter: "ة", latin: "Ta", videoName: "ta"),
    ]
    
}
