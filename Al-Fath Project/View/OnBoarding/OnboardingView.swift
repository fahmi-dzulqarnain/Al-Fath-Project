//
//  OnboardingView.swift
//  Al-Fath Project
//
//  Created by Rio Sudarsono on 28/10/21.
//

import SwiftUI
import CoreData

struct OnboardingView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var isFirstTime = UserDefaults.standard.isFirstTime()
    @State private var selection = 0
    @State var isShow = false
    
    let images = ["1","2","3"]
    
    var body: some View {
        NavigationView {
            ZStack {
                if isFirstTime {
                    MainView()
                } else {
                    onBoard
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
            TabView(selection : $selection){
                ForEach(0..<images.count){ i in
                    VStack {
                        Image(systemName: "cloud.fill")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width, height: 200)
                            .padding(.bottom, 90)
                        
                        Text("Lorem ipsum dolor sit amet")
                            .font(.system(size: 24))
                        Text("consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                            .font(.system(size: 14))
                            .multilineTextAlignment(.center)
                            .padding(.top, 16)
                        
                        NavigationLink(destination: MainView(), isActive: $isShow ){
                            Text("")
                        }.hidden()
                        
                    }
                }
            }
            .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .padding(.top, 8)
            
            IndexView(numberOfPages: images.count, currentIndex: $selection)
            
            VStack {
                Spacer()
                if images.count-1 == selection {
                    Text("Get Started")
                        .onTapGesture{
                            for i in 0...5 {
                                setData(pos: i)
                            }
                            UserDefaults.standard.setFirstTime(value: true)
                            isShow = true
                        }
                }
            }
            
                
        }

    }
    
    func setData(pos: Int) {
        let journey = JourneyEntity(context: viewContext)
        journey.id = Int16(pos)
        journey.isLocked = !(pos == 0)
        journey.title = String(pos)
        journey.image = ""
        journey.points = 0
        PersistneceController.shared.save()
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
