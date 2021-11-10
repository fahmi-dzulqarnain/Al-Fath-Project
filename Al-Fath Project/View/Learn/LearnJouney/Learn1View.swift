//
//  Learn1View.swift
//  Al-Fath Project
//
//  Created by Rio Sudarsono on 08/11/21.

import SwiftUI
import AVKit

struct Learn1View: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [])
    private var journeyData: FetchedResults<JourneyEntity>
    @State var journeyNext = JourneyEntity()
//    @State var journey: JourneyEntity
    
    @ObservedObject var viewModel: LearnViewModel
    
    let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video1", ofType: "mp4")!))
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
//                HStack {
//                    Image(systemName: "chevron.left")
//                        .foregroundColor(.text)
//                        .padding()
//                        .onTapGesture {
//                            viewModel.learn1Show = false
//                        }
//                    Text("Menghafal")
//                        .foregroundColor(.text)
//                        .bold()
//                    Spacer()
//                }
//                .padding(.top, 36)
                VideoPlayer(player: player).frame(height: 450)
                    .onAppear(perform: {
                        player.play()
                    })
                
                Text("ب")
                    .foregroundColor(.text)
                    .bold()
                    .font(.system(size: 72))
                
                Text("Ba")
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
                
                NavigationLink(destination: Learn2View()) {
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
//        .padding(.top, 48)
        .background(Color.third)
        .edgesIgnoringSafeArea(.bottom)
//        .navigationBarTitle("Menghafal", displayMode: .inline)
//        .navigationBarHidden(true)
//        .navigationBarBackButtonHidden(true)
        
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
