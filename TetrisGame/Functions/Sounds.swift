//
//  Sounds.swift
//  TetrisGame
//
//  Created by GYURI on 2023/03/19.
//

import Foundation
import AVKit

class Sounds {
    
    var bgSound : AVAudioPlayer!
    init() {
        if let url = Bundle.main.path(forResource: "bg_sound", ofType: "mp3"){
            do{
                bgSound = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: url))
            }catch{
                print("error")
            }
            bgSound.volume = 0.5
            bgSound.numberOfLoops = -1 // 무한반복
            bgSound.play()
            
        }
    }
}
