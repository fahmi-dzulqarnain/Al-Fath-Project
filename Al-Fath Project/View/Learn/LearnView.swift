//
//  LearnView.swift
//  Al-Fath Project
//
//  Created by Rio Sudarsono on 14/10/21.
//

import SwiftUI

struct LearnView: View {
    
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
        }
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
        LearnView()
    }
}
