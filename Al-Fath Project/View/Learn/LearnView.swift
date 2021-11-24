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
    @ObservedObject var challengeVM = ChallengeViewModel()

    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: -180, alignment: nil),
        GridItem(.flexible(), spacing: -180, alignment: nil),
        GridItem(.flexible(), spacing: -180, alignment: nil)
    ]
    
    let colors = [
        Gradient(colors: [Color(red: 0.95, green: 0.47, blue: 0.42), Color(red: 0.80, green: 0.34, blue: 0.26)]),
        Gradient(colors: [Color(red: 0.31, green: 0.87, blue: 0.42), Color(red: 0.35, green: 0.64, blue: 0.40)]),
        Gradient(colors: [Color(red: 0.17, green: 0.77, blue: 0.96), Color(red: 0.17, green: 0.59, blue: 0.84)]),
        Gradient(colors: [Color(red: 0.72, green: 0.49, blue: 0.90), Color(red: 0.57, green: 0.24, blue: 0.94)]),
        Gradient(colors: [Color(red: 0.95, green: 0.47, blue: 0.42), Color(red: 0.80, green: 0.34, blue: 0.26)])
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack{
//                ForEach (vm.datas.indices, id: \.self) {i in
//                    Text(vm.datas[i].letter).onTapGesture {
//                        viewModel.dataLearn = vm.datas[i]
//                        viewModel.learn1Show = true
//                    }
//                }
                NavigationLink(destination: Learn1View(viewModel: viewModel, vm: vm), isActive: $viewModel.learn1Show) {
                    Text("").hidden()
                }
                NavigationLink(destination: CheckpointView(viewModel: challengeVM), isActive: $viewModel.checkPointShow) {
                    Text("").hidden()
                }
                NavigationLink(destination: CheckpointView(viewModel: challengeVM), isActive: $challengeVM.show) {
                    Text("").hidden()
                }
                NavigationLink(destination: ChallengeDoneView(viewModel: challengeVM), isActive: $challengeVM.showDone) {
                    Text("")
                }
                
            }

            LazyVGrid(columns: columns,
                 alignment: .center,
                 spacing: 0,
                 content: {
                   Section(footer:
                            ButtonFinishLearn(viewModel: viewModel)
                   )
                   {
                    ForEach(Array(journey.enumerated()), id: \.offset) { index, data in
                        Text("")
                        if (!data.isCheckpoint) {
                            ButtonLearn(viewModel: viewModel, title: data.title ?? "", isLocked: data.isLock, bgColor: selectButtonColor(index: index))
                        } else {
                            ButtonCheckPointLearn(viewModel: challengeVM, title: data.title ?? "", isLocked: data.isLock)
                        }
                    }
                    }
                   }
                 )
                .background(Image("home_bg"), alignment: .topLeading)
                .environment(\.layoutDirection, .rightToLeft)
                .padding(.bottom, 180)
        }       .background(Color(red: 0.65, green: 0.85, blue: 0.38))
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
    
    func selectButtonColor(index: Int) -> Gradient {
        let currentIndex = index + 1
        if ((currentIndex % 5) == 0) {
            return colors[4]
            }
            else if ((currentIndex % 4) == 0) {
                return colors[3]
                }
            else if ((currentIndex % 3) == 0) {
                return colors[2]
                }
            else if ((currentIndex % 2) == 0) {
                return colors[1]
                }
            else if ((currentIndex % 1) == 0) {
                return colors[0]
                }
            else {
                return colors[0]
            }
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
    let bgColor : Gradient
    
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
                viewModel.title = title
                viewModel.learn1Show = true
            })
            {
                Text(title)
                    .font(.system(size: 36).bold())
                    .frame(width: 78, height: 78)
                    .foregroundColor(.white)
                    .background(
                        LinearGradient(gradient: bgColor, startPoint: .topLeading, endPoint: .bottom)
                    )
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.white.opacity(0.48), lineWidth: 5)
                            .padding(-2.5)
                            .blur(radius: 1)
                    )
            }.padding(.top, 78)
    }
}
}

struct ButtonCheckPointLearn : View {
    
    var viewModel: ChallengeViewModel
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
                viewModel.title = title
                viewModel.show = true
            }){
            Image("ic_home_finish").resizable().frame(width: 42, height: 42)
                .frame(width: 78, height: 78)
                .foregroundColor(.white)
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color(red: 0.99, green: 0.85, blue: 0.35), Color(red: 0.89, green: 0.58, blue: 0.05)]), startPoint: .topLeading, endPoint: .bottom)
                )
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color.white.opacity(0.48), lineWidth: 10)
                        .padding(-4.5)
                        .blur(radius: 1)
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
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color(red: 0.99, green: 0.85, blue: 0.35), Color(red: 0.89, green: 0.58, blue: 0.05)]), startPoint: .topLeading, endPoint: .bottom)
                    )
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.white.opacity(0.48), lineWidth: 10)
                            .padding(-4.5)
                            .blur(radius: 1)
                    )
            }
            .padding(.top, 234)
        }
    }
}

