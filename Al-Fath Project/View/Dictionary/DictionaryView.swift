//
//  DictionaryView.swift
//  Al-Fath Project
//
//  Created by Fahmi Dzulqarnain on 17/11/21.
//

import Foundation
import SwiftUI
import AVKit

struct DictionaryView: View {
    
    var vm: DictionaryListViewModel
    let player: AVPlayer
    let noFirstPositionLetter = ["ة" ,"و" ,"ز" ,"ر" , "ذ" ,"د" ,"ا"]
    let differentPositionLetter = ["ة" ,"و" ,"ز" ,"ر" , "ذ" ,"د"]
    let gridItems = [
        GridItem(.adaptive(minimum: 110, maximum: 330)),
        GridItem(.adaptive(minimum: 110, maximum: 330))
    ]
    
    var body: some View {
        VStack (alignment: HorizontalAlignment.center) {
            AVPlayerControllerRepresented(player: player)
                .onAppear {
                    player.play()
                }
                .frame(height: 500)
                .cornerRadius(15)
            
            Spacer(minLength: 20)
            Text(vm.dictionaryData.latin)
                .foregroundColor(.text)
                .bold()
                .font(.custom("Rounded Mplus 1c Bold", size: 41, relativeTo: .largeTitle))
            
            LazyVGrid (columns: gridItems) {
                ForEach (1..<5) {number in
                    switch number {
                        case 1:
                            ShowLetter(vm: vm, position: .individual)
                        case 2:
                        if (noFirstPositionLetter.contains(vm.dictionaryData.letter)){
                                ShowLetter(vm: vm, position: .individual)
                            } else {
                                ShowLetter(vm: vm, position: .first)
                            }
                        case 3:
                            if (vm.dictionaryData.letter == "ا"){
                                ShowLetter(vm: vm, position: .individual)
                            } else if (differentPositionLetter.contains(vm.dictionaryData.letter)) {
                                ShowLetter(vm: vm, position: .last)
                            } else {
                                ShowLetter(vm: vm, position: .middle)
                            }
                        case 4:
                            ShowLetter(vm: vm, position: .last)
                        default:
                            Text(vm.dictionaryData.letter)
                    }
                }
            }
            .padding(.top, -40)
            .environment(\.layoutDirection, .rightToLeft)
            
            Spacer()
        }
        .background(Color("ColorPrimary"))
        .ignoresSafeArea()
    }
}

struct DictionaryView_Previews: PreviewProvider {
    static var previews: some View {
        DictionaryView(vm: DictionaryListViewModel(),
                       player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: DictionaryListViewModel().dictionaryData.videoName, ofType: "mp4")!)))
    }
}

struct ShowLetter : View {
    let vm: DictionaryListViewModel
    let position: LetterPosition
    
    var body: some View {
        switch position {
        case .individual:
            Text(vm.dictionaryData.letter)
                .font(.custom("ScheherazadeNew-Regular", size: 50, relativeTo: .largeTitle))
        case .first:
            Text(vm.dictionaryData.letter + "ـــ")
                .font(.custom("ScheherazadeNew-Regular", size: 50, relativeTo: .largeTitle))
        case .middle:
            Text("ـــ\(vm.dictionaryData.letter)ـــ")
                .font(.custom("ScheherazadeNew-Regular", size: 50, relativeTo: .largeTitle))
        case .last:
            Text("ــ\(vm.dictionaryData.letter)")
                .font(.custom("ScheherazadeNew-Regular", size: 50, relativeTo: .largeTitle))
        }
    }
}

struct AVPlayerControllerRepresented : UIViewControllerRepresentable {
    var player : AVPlayer
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = false
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        
    }
}

enum LetterPosition {
    case individual, first, middle, last
}
