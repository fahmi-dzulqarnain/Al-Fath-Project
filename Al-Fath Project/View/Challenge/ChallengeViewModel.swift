//
//  ChallengeViewModel.swift
//  Al-Fath Project
//
//  Created by Rio Sudarsono on 04/11/21.
//

import Foundation

class ChallengeViewModel: ObservableObject {
    
    @Published var data: [GamesModel] = []
    
    func randomQuiz() {
        let number = Int.random(in: 1...3)
        switch number {
        case 1:
            data = quiz1()
        case 2:
            data = quiz2()
        case 3:
            data = quiz3()
        default:
            data = quiz1()
        }
        
    }
    
    func quiz1() -> [GamesModel] {
        return [
            GamesModel(name: "Satu", code: 1, isChoose: false, isHidden: false),
            GamesModel(name: "Dua", code: 2, isChoose: false, isHidden: false),
            GamesModel(name: "Tiga", code: 3, isChoose: false, isHidden: false),
            GamesModel(name: "Empat", code: 4, isChoose: false, isHidden: false),
            GamesModel(name: "Lima", code: 5, isChoose: false, isHidden: false),
            GamesModel(name: "1", code: 1, isChoose: false, isHidden: false),
            GamesModel(name: "2", code: 2, isChoose: false, isHidden: false),
            GamesModel(name: "3", code: 3, isChoose: false, isHidden: false),
            GamesModel(name: "4", code: 4, isChoose: false, isHidden: false),
            GamesModel(name: "5", code: 5, isChoose: false, isHidden: false)]
    }
    
    func quiz2() -> [GamesModel] {
        return [
            GamesModel(name: "Enam", code: 6, isChoose: false, isHidden: false),
            GamesModel(name: "tujuh", code: 7, isChoose: false, isHidden: false),
            GamesModel(name: "delapan", code: 8, isChoose: false, isHidden: false),
            GamesModel(name: "sembilan", code: 9, isChoose: false, isHidden: false),
            GamesModel(name: "sepuluh", code: 10, isChoose: false, isHidden: false),
            GamesModel(name: "6", code: 6, isChoose: false, isHidden: false),
            GamesModel(name: "7", code: 7, isChoose: false, isHidden: false),
            GamesModel(name: "8", code: 8, isChoose: false, isHidden: false),
            GamesModel(name: "9", code: 9, isChoose: false, isHidden: false),
            GamesModel(name: "10", code: 10, isChoose: false, isHidden: false)]
    }
    
    func quiz3() -> [GamesModel] {
        return [
            GamesModel(name: "sebelas", code: 11, isChoose: false, isHidden: false),
            GamesModel(name: "dua belas", code: 12, isChoose: false, isHidden: false),
            GamesModel(name: "Tiga belas", code: 13, isChoose: false, isHidden: false),
            GamesModel(name: "Empat belas", code: 14, isChoose: false, isHidden: false),
            GamesModel(name: "Lima belas", code: 15, isChoose: false, isHidden: false),
            GamesModel(name: "11", code: 11, isChoose: false, isHidden: false),
            GamesModel(name: "12", code: 12, isChoose: false, isHidden: false),
            GamesModel(name: "13", code: 13, isChoose: false, isHidden: false),
            GamesModel(name: "14", code: 14, isChoose: false, isHidden: false),
            GamesModel(name: "15", code: 15, isChoose: false, isHidden: false)]
    }
}
