//
//  DownButton.swift
//  TetrisGame
//
//  Created by GYURI on 2023/03/15.
//

import Foundation
import SpriteKit

class DownButton {
    
    let btn = SKSpriteNode()
    init() {
        btn.texture = SKTexture(imageNamed: "down_btn1")
        btn.size = CGSize(width: 50, height: 50)
        btn.name = "down"
        btn.zPosition = 1
        let point1 = Int(Variables.scene.frame.width) / 2
        let point2 = -50
        let xValue = (point1 - point2) / 2
        btn.position = CGPoint(x: xValue, y: -Int(Variables.scene.frame.height) + 40)
        Variables.scene.addChild(btn)
    }
    
    func anim(){
        var textures = Array<SKTexture>()
        var action = SKAction()
        for i in 1...15{
            let name = "down_btn\(i)"
            let texture = SKTexture(imageNamed: name)
            textures.append(texture)
        }
        action = SKAction.animate(with: textures, timePerFrame: 0.03)
        btn.run(action)
    }
}
