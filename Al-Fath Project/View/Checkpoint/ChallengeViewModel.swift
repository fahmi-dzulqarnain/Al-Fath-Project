//
//  ChallengeViewModel.swift
//  Al-Fath Project
//
//  Created by Rio Sudarsono on 04/11/21.
//

import Foundation

class ChallengeViewModel: ObservableObject {
    
    @Published var title = ""
    @Published var data: [GamesModel] = []
    @Published var data2: [GamesModel] = []
    
    init(){
        randomQuiz()
    }
    
    func randomQuiz() {
        let number = Int.random(in: 1...3)
        switch number {
        case 1:
            quiz1()
//        case 2:
//            data = quiz2()
//        case 3:
//            data = quiz3()
        default:
            quiz1()
        }
        
    }
    
    func quiz1() {
        data = [
            GamesModel(name: "ا", code: 1, isChoose: false, isHidden: false, type: 1, image: "games1_bg"),
            GamesModel(name: "ب", code: 2, isChoose: false, isHidden: false, type: 1, image: "games1_bg"),
            GamesModel(name: "ت", code: 3, isChoose: false, isHidden: false, type: 1, image: "games1_bg"),
            GamesModel(name: "ث", code: 4, isChoose: false, isHidden: false, type: 1, image: "games1_bg"),
            GamesModel(name: "خ", code: 5, isChoose: false, isHidden: false, type: 1, image: "games1_bg"),
            GamesModel(name: "ح", code: 6, isChoose: false, isHidden: false, type: 1, image: "games1_bg")
        ]
        data2 = [
            GamesModel(name: "1", code: 1, isChoose: false, isHidden: false, type: 2, image: "games2"),
            GamesModel(name: "2", code: 2, isChoose: false, isHidden: false, type: 2, image: "games2"),
            GamesModel(name: "3", code: 3, isChoose: false, isHidden: false, type: 2, image: "games2"),
            GamesModel(name: "4", code: 4, isChoose: false, isHidden: false, type: 2, image: "games2"),
            GamesModel(name: "5", code: 5, isChoose: false, isHidden: false, type: 2, image: "games2"),
            GamesModel(name: "6", code: 6, isChoose: false, isHidden: false, type: 2, image: "games2")
        ]
        
    }
    
 
}
