//
//  File.swift
//  Al-Fath Project
//
//  Created by Muhammad Firdaus on 17/11/21.
//

import Foundation

struct LearnModel {
    var isLock: Bool = false
    var isCheckpoint: Bool = false
    var points: Int? = nil
    var title: String = ""
    var dictionary: DictionaryModel = DictionaryModel(letter: "", latin: "", videoName: "")
}
