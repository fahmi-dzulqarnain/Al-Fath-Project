//
//  LearnViewModel.swift
//  Al-Fath Project
//
//  Created by Rio Sudarsono on 09/11/21.
//

import Foundation

class LearnViewModel: ObservableObject {
    
    @Published var learn1Show: Bool = false
    @Published var checkPointShow: Bool = false
    @Published var dataLearn = DictionaryData(letter: "", latin: "", videoName: "", code: 0)
    @Published var nextLearn = DictionaryData(letter: "", latin: "", videoName: "", code: 0)
}
