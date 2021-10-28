//
//  VideoView.swift
//  Al-Fath Project
//
//  Created by Rio Sudarsono on 26/10/21.
//

import SwiftUI
import AVKit

struct VideoView: View {
    let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video1", ofType: "mp4")!))
    
    var body: some View {
        VideoPlayer(player: player)
            .frame(height: 400)
            .onAppear(perform: {
                player.play()
            })
//            .disabled(true)
//        Button(action: {
//            player.
//            player.play()
//        }, label: {
//            Text("Replay")
//        })
        
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView()
    }
}
