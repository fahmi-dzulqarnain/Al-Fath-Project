//
//  File.swift
//  Al-Fath Project
//
//  Created by Muhammad Firdaus on 17/11/21.
//

import Foundation

struct LearnModel {
    var id: Int16 = 0
    var isLock: Bool = false
    var isCheckpoint: Bool = false
    var points: Int? = nil
    var title: String = ""
    var latin: String = ""
    var dictionary: DictionaryModel = DictionaryModel(letter: "", latin: "", videoName: "")
}
