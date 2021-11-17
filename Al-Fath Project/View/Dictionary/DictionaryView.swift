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
    let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "alif", ofType: "mp4")!))
    let gridItems = [
        GridItem(.adaptive(minimum: 110, maximum: 330)),
        GridItem(.adaptive(minimum: 110, maximum: 330))
    ]
    
    var body: some View {
        VStack (alignment: HorizontalAlignment.center) {
            AVPlayerControllerRepresented(player: player)
                .onAppear {
                    player.play()
                    player.isMuted
                }
                .cornerRadius(15)
            
            Text(vm.dictionaryData.latin)
                .foregroundColor(.text)
                .bold()
                .font(.custom("Rounded Mplus 1c Bold", size: 41, relativeTo: .largeTitle))
                .padding(.top, 10)
            
            LazyVGrid (columns: gridItems) {
                ForEach (1..<5) {number in
                    switch number {
                        case 1:
                            Text(vm.dictionaryData.letter)
                            .font(.custom("ScheherazadeNew-Regular", size: 41, relativeTo: .largeTitle))
                            .padding(.bottom, 2)
                        case 2:
                            Text(vm.dictionaryData.letter + "ـ")
                            .font(.custom("ScheherazadeNew-Regular", size: 41, relativeTo: .largeTitle))
//                            .padding(.bottom, 5)
                        case 3:
                            Text("ـ\(vm.dictionaryData.letter)ـ")
                            .font(.custom("ScheherazadeNew-Regular", size: 41, relativeTo: .largeTitle))
                            .padding(.bottom, 5)
                        case 4:
                            Text("ـ\(vm.dictionaryData.letter)")
                            .font(.custom("ScheherazadeNew-Regular", size: 41, relativeTo: .largeTitle))
                            .padding(.bottom, 5)
                        default:
                            Text(vm.dictionaryData.letter)
                    }
                }
            }
            .environment(\.layoutDirection, .rightToLeft)
            
            Spacer()
        }
        .background(Color("ColorPrimary"))
        .ignoresSafeArea(.container)
    }
}

struct DictionaryView_Previews: PreviewProvider {
    static var previews: some View {
        DictionaryView(vm: DictionaryListViewModel())
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
