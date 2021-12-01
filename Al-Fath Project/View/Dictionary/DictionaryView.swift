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
    let url = Bundle.main.path(forResource: Global.videoName, ofType: "mp4")
    let player: AVPlayer = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: Global.videoName, ofType: "mp4") ?? ""))
    let noFirstPositionLetter = ["ة" ,"و" ,"ز" ,"ر" , "ذ" ,"د" ,"ا"]
    let differentPositionLetter = ["ة" ,"و" ,"ز" ,"ر" , "ذ" ,"د"]
    let gridItems = [
        GridItem(.adaptive(minimum: 110, maximum: 330)),
        GridItem(.adaptive(minimum: 110, maximum: 330))
    ]
    
    var body: some View {
        ZStack(alignment: .top) {
        VStack {
            AVPlayerControllerRepresented(player: player)
                .onAppear {
                    player.play()
                }
                .frame(height: 400)
                .padding(.top, 90)
                .cornerRadius(20)
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.2), radius: 5, x: 2, y: 2)
                .overlay(isUrlEmpty(url: url ?? "") ? Text("Akan Segera hadir").foregroundColor(.white) : Text(""))
        
            
            VStack {
                Text(vm.dictionaryData.latin)
                    .foregroundColor(.text)
                    .bold()
                    .scaledToFit()
                    .font(.custom("Rounded Mplus 1c Bold", size: 41, relativeTo: .largeTitle))
                    .padding(.top, 10)
                
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
                .padding(.top, -10)
                .padding(.bottom, 20)
                .environment(\.layoutDirection, .rightToLeft)
            }.background(Color.white.opacity(80))
            .cornerRadius(10)
            .padding(.top, 10)
            .padding(.horizontal, 20)
            
            Spacer()
        }
            title
        }
        .background(Color.greenLight)
        .ignoresSafeArea()
        .navigationBarHidden(true)
        .navigationBarTitle("", displayMode: .inline)
    }
    
    func isUrlEmpty(url: String) -> Bool {
        return url == "" ? true: false
    }
    
    var title: some View {
        ZStack {
            HStack {
                Spacer()
                Image("ic_dictionary_content")
                    .resizable()
                    .frame(width: 48, height: 48)
                Spacer()
            }
            HStack {
                Button {
                    vm.showDictionary = false
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.text)
                        .padding(.vertical, 14)
                        .padding(.horizontal)
                        .background(Color.secondary)
                        .cornerRadius(99)
                        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.2), radius: 5, x: 2, y: 2)
                        .padding(.horizontal)
                }

                Spacer()
            }
        }
        .padding(.top, 48)
        .padding(.bottom)
        .background(Color.colorGreen)
        .cornerRadius(20)
        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.2), radius: 5, x: 2, y: 2)
    }
}

struct DictionaryView_Previews: PreviewProvider {
    static var previews: some View {
        DictionaryView(vm: DictionaryListViewModel())
    }
}

struct ShowLetter : View {
    let vm: DictionaryListViewModel
    let position: LetterPosition
    
    var body: some View {
        switch position {
        case .individual:
            Text(vm.dictionaryData.letter)
                .font(.custom("ScheherazadeNew-Regular", size: 50, relativeTo: .largeTitle).bold())
        case .first:
            Text(vm.dictionaryData.letter + "ـــ")
                .font(.custom("ScheherazadeNew-Regular", size: 50, relativeTo: .largeTitle).bold())
        case .middle:
            Text("ـــ\(vm.dictionaryData.letter)ـــ")
                .font(.custom("ScheherazadeNew-Regular", size: 50, relativeTo: .largeTitle).bold())
        case .last:
            Text("ــ\(vm.dictionaryData.letter)")
                .font(.custom("ScheherazadeNew-Regular", size: 50, relativeTo: .largeTitle)
                        .bold())
        }
    }
}

struct AVPlayerControllerRepresented : UIViewControllerRepresentable {
    var player : AVPlayer
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = false
        controller.player?.isMuted = true
        controller.player?.play()
        controller.videoGravity = AVLayerVideoGravity.resizeAspectFill
        print(player.currentItem)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        
    }
}

enum LetterPosition {
    case individual, first, middle, last
}
