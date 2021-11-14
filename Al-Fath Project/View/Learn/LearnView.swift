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
    @State var showCheckPoint = false
    
    var body: some View {
        VStack{
            NavigationLink(
                destination: VideoView(),
                label: {
                    Text("Video")
                }).padding()
            
            Button(action: {
                showCheckPoint = true
            }, label: {
                Text("Checkpoint")
            }).padding()
            
            NavigationLink(destination: CheckpointView(isShow: $showCheckPoint), isActive: $showCheckPoint){
                Text("")
            }
            
            ForEach(journey){ data in
                ZStack{
                    Text(data.title ?? "")
                        .foregroundColor(data.isLocked ? Color.blue : Color.red)
                        .onTapGesture {
                            viewModel.learn1Show = true
                        }
                }
            }
            
            Spacer()
            HStack {Spacer()}
        }
        .background(Color.secondary)
        .edgesIgnoringSafeArea(.top)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("Menghafal", displayMode: .inline)
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
