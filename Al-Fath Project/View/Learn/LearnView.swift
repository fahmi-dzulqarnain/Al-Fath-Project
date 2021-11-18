//
//  LearnView.swift
//  Al-Fath Project
//
//  Created by Rio Sudarsono on 14/10/21.
//

import SwiftUI

struct LearnView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [])
    private var journey: FetchedResults<JourneyEntity>
    @ObservedObject var viewModel: LearnViewModel
    @ObservedObject var vm = DictionaryListViewModel()

    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: -180, alignment: nil),
        GridItem(.flexible(), spacing: -180, alignment: nil),
        GridItem(.flexible(), spacing: -180, alignment: nil)
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack{
                ForEach (vm.datas.indices, id: \.self) {i in
                    Text(vm.datas[i].letter).onTapGesture {
                        viewModel.dataLearn = vm.datas[i]
                        viewModel.learn1Show = true
                    }
                }
                NavigationLink(destination: Learn1View(viewModel: viewModel, vm: vm), isActive: $viewModel.learn1Show) {
                    Text("").hidden()
                }
                NavigationLink(destination: CheckpointView(), isActive: $viewModel.checkPointShow) {
                    Text("").hidden()
                }
                
            }.padding(.top, 48)

            LazyVGrid(columns: columns,
                 alignment: .center,
                 spacing: 0,
                 content: {
                   Section(footer:
                            ButtonFinishLearn(viewModel: viewModel)
                   )
                   {
                    ForEach(journey) { data in
                        Text("")
                        if (!data.isCheckpoint) {
                            ButtonLearn(viewModel: viewModel, title: data.title ?? "", isLocked: data.isLock)
                        } else {
                            ButtonCheckPointLearn(viewModel: viewModel, isLocked: data.isLock)
                        }
                    }
                    }
                   }
                 )
                .background(Image("home_bg"), alignment: .topLeading)
                .environment(\.layoutDirection, .rightToLeft)
                .padding(.bottom, 180)
        }       .background(Color(red: 0.97, green: 0.80, blue: 0.50))
       .edgesIgnoringSafeArea(.all)
       .navigationBarHidden(true)
       .navigationBarTitle("", displayMode: .inline)
    }
        
    func simpleSuccess() {
        if !UserDefaults.standard.isHaptic() {
            return
        }
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
}

struct LearnView_Previews: PreviewProvider {
    static var previews: some View {
        LearnView(viewModel: LearnViewModel())
    }
}


// ----------------------- Sub View ------------------------ //
struct ButtonLearn : View {
    
    var viewModel : LearnViewModel
    var title : String
    var isLocked : Bool
    
    var body: some View {
        if isLocked {
            Button(action: {
            })
            {
                Text(title)
                    .font(.system(size: 36).bold())
                    .frame(width: 78, height: 78)
                    .foregroundColor(.white)
                    .background(Color(red: 0.86, green: 0.67, blue: 0.36))
                    .clipShape(Circle())
                    .overlay(Image("ic_padlock")
                                .resizable()
                                .frame(width: 18, height: 24, alignment: .top)
                                .offset(x: 0, y: -40))
            }
            .padding(.top, 78)
            .disabled(true)
        } else {
            Button(action: {
                viewModel.learn1Show = true
            })
            {
                Text(title)
                    .font(.system(size: 36).bold())
                    .frame(width: 78, height: 78)
                    .foregroundColor(.white)
                    .background(Color(red: 0.95, green: 0.47, blue: 0.42))
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.white.opacity(0.48), lineWidth: 8)
                    )
            }.padding(.top, 78)
    }
}
}

struct ButtonCheckPointLearn : View {
    
    var viewModel : LearnViewModel
    var title : String
    var isLocked : Bool
    
    var body: some View {
        if isLocked {
            Button(action: {
            })
            {
            Image("ic_home_finish").resizable().frame(width: 42, height: 42)
                .frame(width: 78, height: 78)
                .foregroundColor(.white)
                .background(Color(red: 0.36, green: 0.24, blue: 0.03))
                .clipShape(Circle())
                .overlay(Image("ic_padlock")
                            .resizable()
                            .frame(width: 18, height: 24, alignment: .top)
                            .offset(x: 0, y: -40))
            }
            .padding(.top, 78)
            .disabled(true)
        } else {
            Button(action: {
                let _ = print(title)
                let _ = print("press")
                viewModel.unlockNextLevel(title: title)
            })
            {
            Image("ic_home_finish").resizable().frame(width: 42, height: 42)
                .frame(width: 78, height: 78)
                .foregroundColor(.white)
                .background(Color(red: 0.95, green: 0.47, blue: 0.42))
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color.white.opacity(0.48), lineWidth: 8)
                )
            }
            .padding(.top, 78)
        }
    }
}

struct ButtonFinishLearn : View {
    
    var viewModel : LearnViewModel
    
    var body: some View {
        if (viewModel.isFinishLock) {
            Button(action: {
            })
            {
                Image("ic_home_finish")
                    .resizable()
                    .frame(width: 73, height: 73)
                    .frame(width: 110, height: 110)
                    .background(Color(red: 0.78, green: 0.51, blue: 0.05))
                    .clipShape(Circle())
                    .overlay(Image("ic_padlock")
                                .resizable()
                                .frame(width: 18, height: 24, alignment: .top)
                                .offset(x: 0, y: -60))
            }
            .padding(.top, 234)
            .disabled(true)
        } else {
            Button(action: {
            })
            {
                Image("ic_home_finish")
                    .resizable()
                    .frame(width: 73, height: 73)
                    .frame(width: 110, height: 110)
                    .background(Color(red: 0.78, green: 0.51, blue: 0.05))
                    .clipShape(Circle())
            }
            .padding(.top, 234)
        }
    }
}

