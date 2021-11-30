//
//  OnboardingView.swift
//  Al-Fath Project
//
//  Created by Rio Sudarsono on 28/10/21.
//

import SwiftUI
import CoreData

struct OnboardingView: View {
    
    @ObservedObject var viewModel: OnBoardingViewModel
    @Environment(\.managedObjectContext) private var viewContext
    
    @AppStorage("isFirstTime") private var isFirstTime = false
    @State private var selection = 0
    @State var isShow = false
    
    let images = ["Illustration3","Illustration2","Illustration1"]
    let captions = ["Assalamualaikum", "Belajar huruf hijaiyah dengan mudah", "Bismillah"]
    
    var body: some View {
        NavigationView {
            ZStack {
                if (!isFirstTime) {
                    onBoard
                } else {
                    MainView()
                }
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
        .accentColor(.text) 
        .background(Color.secondary)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    var onBoard: some View {
        ZStack {
            Color.greenLight
                .ignoresSafeArea()
            TabView(selection : $selection){
                ForEach(0..<images.count){ i in
                    VStack {
                        Image(images[i])
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                            .padding(.vertical, 64)
                        IndexView(numberOfPages: images.count, currentIndex: $selection)
                        Text(captions[i])
                            .font(.system(size: 24))
                            .frame(maxWidth: .infinity, alignment: .center)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color.white)
                            .padding(.all, 24)
                            .font(.custom("Rounded Mplus 1c Bold", size: 36, relativeTo: .largeTitle))
                        
                        NavigationLink(destination: MainView(), isActive: $isShow ){
                            Text("")
                        }.hidden()
                        
                    }
                }
            }
            .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .padding(.top, 8)
            .background(Color.greenLight)
            
            VStack {
                Spacer()
                if images.count-1 == selection {
                    Text("Get Started")
                        .padding()
                        .frame(width: UIScreen.main.bounds.width / 2, alignment: .center)
                        .background(Color.orange)
                        .foregroundColor(Color.white)
                        .cornerRadius(24)
                        .font(Font.headline.weight(.bold))
                        .onTapGesture{
                            isShow = true
                            UserDefaults.standard.setFirstTime(value: true)
                        }
                }
            }
            
                
        }.onAppear(perform: {
            for item in viewModel.dataLearn {
                setData(item: item)
            }
        })

    }
    
    func setData(item: LearnModel) {
        let journey = JourneyEntity(context: viewContext)
        journey.id = item.id
        journey.isLock = item.isLock
        journey.isCheckpoint = item.isCheckpoint
        journey.title = item.title
        journey.points = Int16(item.points ?? 0)
        PersistneceController.shared.save()
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(viewModel: OnBoardingViewModel())
    }
}
