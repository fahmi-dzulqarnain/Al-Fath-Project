//
//  Challenge3View.swift
//  Al-Fath Project
//
//  Created by Rio Sudarsono on 03/11/21.
//

import SwiftUI

struct Challenge3View: View {
    
    @ObservedObject var viewModel: ChallengeViewModel
    @State var model1: GamesModel = GamesModel(name: "", code: 0)
    @State var model2: GamesModel = GamesModel(name: "", code: 0)
    @State var isDone = 0
    @State var isShow = false
    
    var items: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        ZStack {
            ScrollView {
                LazyVGrid(columns: items, spacing: 10) {
                    ForEach(0..<viewModel.data.count) { index in
                        ZStack{
                            HStack {
                                Spacer()
                                VStack {
                                    Text(viewModel.data[index].name)
                                        .foregroundColor(.gray)
                                        .bold()
                                        .font(.system(size: 14))
                                        .foregroundColor(Color("ColorText"))
                                }
                                .padding(.vertical, 48)
                                Spacer()
                            }
                            .background(viewModel.data[index].isChoose ? Color.blue : Color.white)
                            .cornerRadius(8)
                            .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.2), radius: 5, x: 2, y: 2)
                            .padding(.horizontal, 30)
                            .padding(.vertical, 8)
                            .onTapGesture {
                                if !viewModel.data[index].isHidden {
                                    if model1.code == 0 {
                                        viewModel.data[index].isChoose = true
                                        model1 = viewModel.data[index]
                                        model1.index = index
                                    } else {
                                        if model2.code == 0 {
                                            model2 = viewModel.data[index]
                                            model2.index = index
                                            viewModel.data[index].isChoose = true
                                            if model1.code == model2.code{
                                                if model1.name != model2.name {
                                                    viewModel.data[model1.index ?? 0].isChoose = false
                                                    viewModel.data[model2.index ?? 0].isChoose = false
                                                    viewModel.data[model1.index ?? 0].isHidden = true
                                                    viewModel.data[model2.index ?? 0].isHidden = true
                                                    model1 = GamesModel(name: "", code: 0)
                                                    model2 = GamesModel(name: "", code: 0)
                                                    isDone = isDone + 1
                                                    if isDone == 5 {
                                                       isShow = true
                                                    }
                                                }
                                                viewModel.data[model1.index ?? 0].isChoose = false
                                                viewModel.data[model2.index ?? 0].isChoose = false
                                                model1 = GamesModel(name: "", code: 0)
                                                model2 = GamesModel(name: "", code: 0)
                                            } else {
                                                viewModel.data[model1.index ?? 0].isChoose = false
                                                viewModel.data[model2.index ?? 0].isChoose = false
                                                model1 = GamesModel(name: "", code: 0)
                                                model2 = GamesModel(name: "", code: 0)
                                                
                                            }
                                        }
                                    }
                                }
                            }
    //                        .isHidden(viewModel.data[index].isHidden)
                            .onAppear(perform: {
                                viewModel.data[model1.index ?? 0].isChoose = false
                                viewModel.data[model2.index ?? 0].isChoose = false
                                model1 = GamesModel(name: "", code: 0)
                                model2 = GamesModel(name: "", code: 0)
                            })
                        }
                        .background(viewModel.data[index].isHidden ? Color.green : Color.white)
                    }
                }
            }
            NavigationLink(destination: ChallengeDoneView(viewModel: viewModel), isActive: $isShow) {
                Text("")
            }
        }
        .padding(.horizontal, 24)
        
    }
}

//struct Challenge3View_Previews: PreviewProvider {
//    static var previews: some View {
//        Challenge3View()
//    }
//}
