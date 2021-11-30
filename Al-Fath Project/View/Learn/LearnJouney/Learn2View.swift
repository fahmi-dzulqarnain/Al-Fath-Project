//
//  Learn2View.swift
//  Al-Fath Project
//
//  Created by Rio Sudarsono on 10/11/21.
//

import SwiftUI

struct Learn2View: View {
    @State private var overlayPoints: [CGPoint] = []
    @State private var huruf: String = ""
    @State private var comingFromUIKitVC = ""
    
    @ObservedObject var viewModel: LearnViewModel
    @ObservedObject var vm: DictionaryListViewModel
    @State var nextLearn = DictionaryData(letter: "", latin: "", videoName: "", code: 0)
    
    @State var isShow = false
    @State var showTutor = true
    @State var isCheckpoint = false

    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top) {
                VStack {
                    ZStack {
                        CameraView(bindedValue: viewModel.dataLearn.videoName, onTrue: {
                            isShow = true
                        }) {
                            overlayPoints = $0;
                        }

                        HStack{
                            Spacer()
                            Image("ic_rectangle_white2")
                                .resizable()
                                .scaledToFit()
                                .padding()
                            Spacer()
                        }
                    }.padding(.top, 100)
                    
                    HStack {
                        Spacer()
                        Text(viewModel.dataLearn.videoName + comingFromUIKitVC)
                            .foregroundColor(.text)
                            .bold()
                            .font(.custom("ScheherazadeNew-Regular", size: 52, relativeTo: .largeTitle))
                        Spacer()
                    }
                    .padding(.vertical)
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(12)
                    .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.2), radius: 5, x: 2, y: 2)
                    .padding()
                    .onAppear {
                        if viewModel.dataLearn.videoName == comingFromUIKitVC {
                            isShow = true
                        }
                    }
                    
                    Spacer()
//                    HStack(alignment: .bottom){
//                        Image("img_cactus1")
//                        Spacer()
//                        Image("img_cactus3")
//                        Image("img_cactus2")
                        
//                    }.padding(.horizontal)
                }
                HStack{
                    Image("ic_camera")
                        .resizable()
                        .frame(width: 48, height: 36)
                        .padding()
                    Spacer()
                }
                .padding(.top, 100)
                .padding()
                title
            }
            
//            HStack {
//                Spacer()
//                if isCheckpoint {
//                    Image("ic_checklist")
//                        .resizable()
//                        .frame(width: 36, height: 36)
//                        .padding(.all, 30)
//                        .background(Color.secondary)
//                        .cornerRadius(99)
//                        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.2), radius: 5, x: 2, y: 2)
//                        .onTapGesture {
//                            PersistneceController.shared.unlockNextLearn(title: viewModel.title)
//                            viewModel.learn1Show = false
//                            viewModel.checkPointShow = true
//                            viewModel.page = 1
//                        }
//                } else {
//                    Image("ic_checklist")
//                        .resizable()
//                        .frame(width: 36, height: 36)
//                        .padding(.all, 30)
//                        .background(Color.secondary)
//                        .cornerRadius(99)
//                        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.2), radius: 5, x: 2, y: 2)
//                        .onTapGesture {
//                            PersistneceController.shared.unlockNextLearn(title: viewModel.title)
//                            viewModel.title = nextLearn.letter
//                            viewModel.dataLearn = nextLearn
//                            viewModel.page = 1
//                        }
//                }
//            }
//            .padding(.horizontal)
//            .padding(.bottom, 48)
            
//            CorrectView(isShow: $isShow)
            
            ForEach(vm.datas, id:\.id){ item in
                Text("").onAppear {
                    let count = viewModel.dataLearn.code + 1
                    switch (count) {
                    case 6:
                        isCheckpoint = true
                    default:
                        if item.code == count{
                            isCheckpoint = false
                            nextLearn = item
                        }
                    }
                }
            }
            
            if isShow {
                CorrectView(isShow: $isShow, isCheckpoint: $isCheckpoint, nextLearn: $nextLearn, viewModel: viewModel, vm: vm)
            }
            
            if !UserDefaults.standard.isTutorLearn() {
                if showTutor {
                    TutorialView(isShow: $showTutor)
                }
                
            }
            
        }
        .background(Color.greenLight)
        .edgesIgnoringSafeArea(.vertical)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
    
    var title: some View {
        ZStack {
            HStack {
                Spacer()
                Image("ic_latihan")
                    .resizable()
                    .frame(width: 36, height: 48)
                Spacer()
            }
            HStack {
                Button {
                    viewModel.page = 1
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

//struct Learn2View_Previews: PreviewProvider {
//    static var previews: some View {
//        Learn2View()
//    }
//} test
