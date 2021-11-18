//
//  PencocokanView.swift
//  Al-Fath Project
//
//  Created by Rio Sudarsono on 15/11/21.
//

import SwiftUI

struct PencocokanView: View {
    @ObservedObject var viewModel: ChallengeViewModel
    @State var model1: GamesModel = GamesModel(name: "", code: 0)
    @State var model2: GamesModel = GamesModel(name: "", code: 0)
    @State var isDone = 0
    @State var isShow = false
    
    var items: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    var body: some View {
        ZStack {
            ScrollView {
                LazyVGrid(columns: items, spacing: 4) {
                    ForEach(viewModel.data.indices, id:\.self) { index in
                        ZStack{
                            HStack {
                                Spacer()
                                ZStack {
                                    Image(viewModel.data[index].image)
                                    Text(viewModel.data[index].name)
                                        .bold()
                                        .font(.system(size: 36))
                                        .foregroundColor(Color.primary)
                                }
                                .padding(.vertical, 8)
                                Spacer()
                            }
                            .background(viewModel.data[index].isChoose ? Color.blue : Color.primary)
                            .cornerRadius(8)
                            .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.2), radius: 5, x: 2, y: 2)
                            .padding(.horizontal, 8)
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
                                                    if model1.type == 1 {
                                                        viewModel.data[model1.index ?? 0].isHidden = true
                                                    } else {
                                                        viewModel.data2[model1.index ?? 0].isHidden = true
                                                    }
                                                    
                                                    if model2.type == 1 {
                                                        viewModel.data[model2.index ?? 0].isHidden = true
                                                    } else {
                                                        viewModel.data2[model2.index ?? 0].isHidden = true
                                                    }
                                                    
                                                    onDefault()
                                                    isDone = isDone + 1
                                                    if isDone == 5 {
                                                       isShow = true
                                                    }
                                                }
                                                onDefault()
                                            } else {
                                                onDefault()
                                                
                                            }
                                        }
                                    }
                                }
                            }
                            .onAppear(perform: {
                                onDefault()
                            })
                        }
                        .background(viewModel.data[index].isHidden ? Color.green : Color.primary)
                    }
                }
                
                LazyVGrid(columns: items, spacing: 4) {
                    ForEach(viewModel.data.indices, id:\.self) { index in
                        ZStack{
                            HStack {
                                ZStack {
                                    Image(viewModel.data2[index].image)
                                }
                            }
                            .background(viewModel.data2[index].isChoose ? Color.blue : Color.primary)
                            .cornerRadius(8)
                            .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.2), radius: 5, x: 2, y: 2)
                            .padding(.horizontal, 2)
                            .padding(.vertical, 4)
                            .onTapGesture {
                                if !viewModel.data2[index].isHidden {
                                    if model1.code == 0 {
                                        viewModel.data2[index].isChoose = true
                                        model1 = viewModel.data2[index]
                                        model1.index = index
                                    } else {
                                        if model2.code == 0 {
                                            model2 = viewModel.data2[index]
                                            model2.index = index
                                            viewModel.data2[index].isChoose = true
                                            if model1.code == model2.code{
                                                if model1.name != model2.name {
                                                    if model1.type == 1 {
                                                        viewModel.data[model1.index ?? 0].isHidden = true
                                                    } else {
                                                        viewModel.data2[model1.index ?? 0].isHidden = true
                                                    }
                                                    
                                                    if model2.type == 1 {
                                                        viewModel.data[model2.index ?? 0].isHidden = true
                                                    } else {
                                                        viewModel.data2[model2.index ?? 0].isHidden = true
                                                    }
                                                    onDefault()
                                                    isDone = isDone + 1
                                                    if isDone == 6 {
                                                       isShow = true
                                                    }
                                                }
                                                onDefault()
                                            } else {
                                                onDefault()
                                            }
                                        }
                                    }
                                }
                            }
                            .onAppear(perform: {
                                onDefault()
                            })
                        }
                        .padding(.horizontal, 4)
                        .background(viewModel.data2[index].isHidden ? Color.green : Color.primary)
                    }
                }
                
            }
            NavigationLink(destination: ChallengeDoneView(), isActive: $isShow) {
                Text("")
            }
        }
        .padding(.horizontal, 4)
        
    }
    
    func onDefault(){
        viewModel.data[model1.index ?? 0].isChoose = false
        viewModel.data[model2.index ?? 0].isChoose = false
        viewModel.data2[model1.index ?? 0].isChoose = false
        viewModel.data2[model2.index ?? 0].isChoose = false
        model1 = GamesModel(name: "", code: 0)
        model2 = GamesModel(name: "", code: 0)
    }
}

//struct PencocokanView_Previews: PreviewProvider {
//    static var previews: some View {
//        PencocokanView()
//    }
//}
