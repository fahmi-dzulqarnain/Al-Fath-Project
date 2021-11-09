//
//  Learn1View.swift
//  Al-Fath Project
//
//  Created by Rio Sudarsono on 08/11/21.

import SwiftUI

struct Learn1View: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [])
    private var journeyData: FetchedResults<JourneyEntity>
    @State var journeyNext = JourneyEntity()
    @State var journey: JourneyEntity
    
    var body: some View {
        ZStack {
            VStack {
                Button(action: {
                    
                }, label: {
                    Text(journey.title ?? "")
                }).onAppear(perform: {
                    
                })
            }
        }
        
    }
    
    func unlock() {
        
        PersistneceController.shared.save()
    }
}

//struct Learn1View_Previews: PreviewProvider {
//    static var previews: some View {
//        Learn1View()
//    }
//}
