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
    
//    @State var player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: viewMOdel.videoName, ofType: "mp4")!))
    @State var player = AVPlayer()
   
    struct video {
        var videoName = "alif"
    }
    
//    init (){
//        player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: viewModel.title, ofType: "mp4")!))
//    }
    
    var body: some View {
        ZStack {
            if viewModel.page == 1 {
                page1
            } else if viewModel.page == 2 {
                Learn2View(viewModel: viewModel, vm: vm)
            }
            
        }
        .navigationBarHidden(true)
        .navigationBarTitle("", displayMode: .inline)
        .onAppear {
            for (item) in vm.datas {
                if viewModel.title == item.letter{
                    viewModel.dataLearn = item
                }
            }
        }
    }
    
    var page1: some View {
        ZStack(alignment: .bottom) {
            
            content(data: viewModel.dataLearn)
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
                
                NavigationLink(destination: Learn2View(viewModel: viewModel, vm: vm), isActive: $viewModel.learn2Show) {
                    Text("").hidden()
                }
                Button {
                    viewModel.page = 2
                } label: {
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
            .padding(.bottom, 16)
        }
    }
    
    func content(data: DictionaryData) -> some View {
        ZStack(alignment: .top) {
            VStack{
//                VideoPlayer(player: player).frame(height: 495)
                if !data.videoName.isEmpty {
                    AVPlayerControllerRepresented(player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: data.videoName, ofType: "mp4")!)) )
                        .frame(height: 495)
                        .padding(.top, 16)
                        .onAppear {
                            player.play()
                        }
                }
                
                VStack{
                    Text(data.letter)
                        .foregroundColor(.text)
                        .bold()
                        .font(.custom("ScheherazadeNew-Regular", size: 52, relativeTo: .largeTitle))
                    
                    Text(data.latin)
                        .foregroundColor(.text)
                        .font(.custom("Rounded Mplus 1c Bold", size: 36, relativeTo: .largeTitle))
                    HStack{
                        Spacer()
                    }
                }
                .background(Color.white.opacity(0.8))
                .cornerRadius(12)
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.2), radius: 5, x: 2, y: 2)
                .padding(.horizontal)
                .padding(.bottom)
                .padding(.top, 8)

                Spacer()
//                HStack(alignment: .bottom){
//                    Image("img_cactus1")
//                    Image("img_cactus2")
//                    Image("img_cactus3")
//                }
            }
            title
        }
        .background(Color.greenLight)
        .edgesIgnoringSafeArea(.vertical)
        .navigationBarHidden(true)
        .navigationBarTitle("", displayMode: .inline)
        
    }
    
    var title: some View {
        ZStack {
            HStack {
                Spacer()
                Image("ic_menghafal")
                    .resizable()
                    .frame(width: 48, height: 48)
                Spacer()
            }
            HStack {
                Button {
                    viewModel.learn1Show = false
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
        .cornerRadius(12)
        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.2), radius: 5, x: 2, y: 2)
    }
    
}

//struct Learn1View_Previews: PreviewProvider {
//    static var previews: some View {
//        Learn1View()
//    }
//}
