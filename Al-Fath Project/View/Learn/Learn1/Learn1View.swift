//
//  Learn1View.swift
//  Al-Fath Project
//
//  Created by Rio Sudarsono on 08/11/21.
//

import SwiftUI

struct Learn1View: View {
    @Environment(\.managedObjectContext) private var viewContext
    var journey: JourneyEntity
    
    var body: some View {
        ZStack {
            VStack {
                Button(action: {
                    journey.isLocked = false
                    PersistneceController.shared.save()
                }, label: {
                    Text("Unlock Next Journey")
                })
            }
        }
        
        
        
    }
}

//struct Learn1View_Previews: PreviewProvider {
//    static var previews: some View {
//        Learn1View()
//    }
//}
