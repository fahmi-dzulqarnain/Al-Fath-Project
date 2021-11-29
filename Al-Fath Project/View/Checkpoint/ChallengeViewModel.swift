//
//  ChallengeViewModel.swift
//  Al-Fath Project
//
//  Created by Rio Sudarsono on 04/11/21.
//

import Foundation

class ChallengeViewModel: ObservableObject {
    
    @Published var title = ""
    @Published var show = false
    @Published var showDone = false
    @Published var huruf = "ا"
    @Published var kata = KataModel(huruf1: "ب", huruf2: "ت", kata: "تب")
    @Published var data: [GamesModel] = []
    @Published var data2: [GamesModel] = []
    
    init(){
        randomQuiz()
    }
    
    func randomQuiz() {
        let number = Int.random(in: 1...5)
        switch number {
        case 1:
            quiz1()
            huruf = "ا"
            kata = KataModel(huruf1: "ب", huruf2: "ت", kata: "تب")
        case 2:
            quiz1()
            huruf = "ب"
            kata = KataModel(huruf1: "ت", huruf2: "ث", kata: "ثت")
        case 3:
            quiz1()
            huruf = "ت"
            kata = KataModel(huruf1: "ث", huruf2: "ج", kata: "جث")
        case 4:
            quiz1()
            huruf = "ث"
            kata = KataModel(huruf1: "ج", huruf2: "ت", kata: "تج")
        case 5:
            quiz1()
            huruf = "ج"
            kata = KataModel(huruf1: "١", huruf2: "ب", kata: "با")
        default:
            quiz1()
            huruf = "ا"
            kata = KataModel(huruf1: "ب", huruf2: "ت", kata: "تب")
        }
        
    }
    
    func quiz1() {
        data = [
            GamesModel(name: "ث", code: 4, isChoose: false, isHidden: false, type: 1, image: "games1_bg"),
            GamesModel(name: "ت", code: 3, isChoose: false, isHidden: false, type: 1, image: "games1_bg"),
            GamesModel(name: "ا", code: 1, isChoose: false, isHidden: false, type: 1, image: "games1_bg"),
            GamesModel(name: "ب", code: 2, isChoose: false, isHidden: false, type: 1, image: "games1_bg"),
            GamesModel(name: "خ", code: 5, isChoose: false, isHidden: false, type: 1, image: "games1_bg"),
            GamesModel(name: "ث", code: 4, isChoose: false, isHidden: false, type: 1, image: "games1_bg"),
        ]
        data2 = [
            GamesModel(name: "ba", code: 2, isChoose: false, isHidden: false, type: 2, image: "img_ba"),
            GamesModel(name: "tsa", code: 4, isChoose: false, isHidden: false, type: 2, image: "img_tsa"),
            GamesModel(name: "ta", code: 3, isChoose: false, isHidden: false, type: 2, image: "img_ta"),
            GamesModel(name: "alif", code: 1, isChoose: false, isHidden: false, type: 2, image: "img_alif"),
            GamesModel(name: "tsa", code: 4, isChoose: false, isHidden: false, type: 2, image: "img_tsa"),
            GamesModel(name: "jim", code: 5, isChoose: false, isHidden: false, type: 2, image: "img_jim"),
        ]
        
    }
    
    struct KataModel {
        var huruf1: String = ""
        var huruf2: String = ""
        var kata: String = ""
    }
 
}
