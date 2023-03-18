//
//  StopButton.swift
//  TetrisGame
//
//  Created by GYURI on 2023/03/18.
//

import Foundation
import SpriteKit

class StopButton {
    let btn = SKSpriteNode()
    
    init() {
        btn.texture = SKTexture(imageNamed: "stop_btn1")
        btn.size = CGSize(width: 50, height: 50)
        btn.name = "stop"
        let point1 = Int(Variables.scene.frame.width) / 2
        let point2 = Int(Variables.scene.frame.width) - 40
        let xValue = point1 + (point2 - point1) / 2
        btn.zPosition = 1
        btn.position = CGPoint(x: xValue, y: -Int(Variables.scene.frame.height) + 40)
        Variables.scene.addChild(btn)
    }
    
    func anim(){
        var textures = Array<SKTexture>()
        var action = SKAction()
        for i in 1...15{
            let name = "stop_btn\(i)"
            let texture = SKTexture(imageNamed: name)
            textures.append(texture)
        }
        action = SKAction.animate(with: textures, timePerFrame: 0.03)
        btn.run(action)
    }
}
