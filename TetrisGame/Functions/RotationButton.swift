//
//  RotationButton.swift
//  TetrisGame
//
//  Created by GYURI on 2023/03/14.
//

import Foundation
import SpriteKit

class RotationButton{
    
    let btn = SKSpriteNode()
    init() {
        btn.texture = SKTexture(imageNamed: "rotaion_btn1")
        btn.size = CGSize(width: 50, height: 50)
        btn.name = "rotation"
        btn.zPosition = 1
        btn.position = CGPoint(x: Int(Variables.scene.frame.width) / 2 , y: -Int(Variables.scene.frame.height) + 50)
        Variables.scene.addChild(btn)
    }
    
}
