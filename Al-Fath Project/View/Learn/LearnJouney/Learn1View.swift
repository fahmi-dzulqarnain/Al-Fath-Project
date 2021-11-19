//
//  Learn1View.swift
//  Al-Fath Project
//
//  Created by Rio Sudarsono on 08/11/21.

import SwiftUI
import AVKit

struct Learn1View: View {
    @ObservedObject var viewModel: LearnViewModel
    @ObservedObject var vm: DictionaryListViewModel
    
    @State var player = AVPlayer()
    
    var body: some View {
        ZStack(alignment: .bottom) {
//            VStack {
//                HStack {
//                    Button {
//                        viewModel.learn1Show = false
//                    } label: {
//                        Image(systemName: "chevron.left")
//                            .foregroundColor(.text)
//                            .padding()
//                    }
//
//                    Text("Menghafal")
//                        .foregroundColor(.text)
//                        .bold()
//                    Spacer()
//                }
//                .padding(.top, 36)
//            }
            
            ForEach(vm.datas.indices, id:\.self) { i in
                Text("").onAppear {
                    if vm.datas[i].letter == viewModel.title{
                        viewModel.dataLearn = vm.datas[i]
                    }
                }
            }
            
            content(data: viewModel.dataLearn).onAppear {
                player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: viewModel.dataLearn.videoName, ofType: "mp4")!))
                player.play()
            }
            
            HStack {
                Button(action: {
                    player.seek(to: .zero)
                    player.play()
                }, label: {
                    Image("ic_replay")
                        .resizable()
                        .frame(width: 48, height: 48)
                })
                .padding(.all, 24)
                .background(Color.secondary)
                .cornerRadius(99)
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.2), radius: 5, x: 2, y: 2)
                
                Spacer()
                
                NavigationLink(destination: Learn2View(viewModel: viewModel, vm: vm)) {
                    Image("ic_checklist")
                        .resizable()
                        .frame(width: 36, height: 36)
                        .padding(.all, 30)
                        .background(Color.secondary)
                        .cornerRadius(99)
                        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.2), radius: 5, x: 2, y: 2)
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 48)
            
        }
        .background(Color.third)
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarTitle("Menghafal", displayMode: .inline)
//        .navigationBarHidden(true)
    }
    
    func content(data: DictionaryData) -> some View {
        VStack {
            VideoPlayer(player: player).frame(height: 495)
            
            Text(data.letter)
                .foregroundColor(.text)
                .bold()
                .font(.system(size: 72))
            
            Text(data.latin)
                .foregroundColor(.text)
                .bold()
                .font(.system(size: 36))
            
            Spacer()
            HStack(alignment: .bottom){
                Image("img_cactus1")
                Image("img_cactus2")
                Image("img_cactus3")
            }
            
        }
    }
    
    func unlock() {
        
        PersistneceController.shared.save()
    }
}

//struct Learn1View_Previews: PreviewProvider {
//    static var previews: some View {
//        Learn1View()
//    }
//}
