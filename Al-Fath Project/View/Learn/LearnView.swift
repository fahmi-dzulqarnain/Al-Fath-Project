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
    
    func getIconName() -> Image {
        return Image(systemName: "house.fill")
    }
    
    func gettabName() -> Text {
        return Text("Learn test")
    }
    
    var body: some View {
        VStack{
            gettabName()
            NavigationLink(
                destination: VideoView(),
                label: {
                    Text("Video")
                }).padding()
            
            Button(action: {
                simpleSuccess()
            }, label: {
                Text("Test Getar")
            }).padding()
            
            ForEach(journey){ data in
                
                NavigationLink(destination: Learn1View(journey: data)){
                    ZStack{
                        Text(data.title ?? "")
                            .foregroundColor(data.isLocked ? Color.blue : Color.red)
                            .onAppear(perform: {
                               
                            })
                    }
                }
            }
            
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    func simpleSuccess() {
        if !UserDefaults.standard.isHaptic() {
            return
        }
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
}

//struct LearnView_Previews: PreviewProvider {
//    static var previews: some View {
//        LearnView()
//    }
//}
