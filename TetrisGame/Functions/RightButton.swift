//
//  RightButton.swift
//  TetrisGame
//
//  Created by GYURI on 2023/03/13.
//

import Foundation
import SpriteKit

class RightButton {
    
    let btn = SKSpriteNode()
    init() {
        btn.texture = SKTexture(imageNamed: "right_btn1")
        btn.size = CGSize(width: 50, height: 50)
        btn.name = "right"
        btn.zPosition = 1
        btn.position = CGPoint(x: Int(Variables.scene.frame.width) - 50, y: -Int(Variables.scene.frame.height) + 40)
        Variables.scene.addChild(btn)
    }
    
    func anim(){
        var textures = Array<SKTexture>()
        var action = SKAction()
        for i in 1...15{
            let name = "right_btn\(i)"
            let texture = SKTexture(imageNamed: name)
            textures.append(texture)
        }
        action = SKAction.animate(with: textures, timePerFrame: 0.03)
        btn.run(action)
    }
    
    func brickMoveRight(){
        if isMovable(){
            Variables.dx += 1
            var action = SKAction()
            for (i, item) in Variables.brickArrays.enumerated(){
                let x = Int(item.x) + Variables.dx
                let y = Int(item.y) + Variables.dy
                Variables.backarrays[y][x - 1] -= 1
                Variables.backarrays[y][x] += 1
                action = SKAction.moveBy(x: CGFloat(Variables.brickValue.brickSize), y: 0, duration: 0.1)
                Variables.brickNode[i].run(action)
            }
            anim()
        }
    }
    
    func isMovable() -> Bool{
        
        for item in Variables.brickArrays{
            let x = Int(item.x) + Variables.dx
            let y = Int(item.y) + Variables.dy
            
            if Variables.backarrays[y][x+1] == 2{
                return false
            }
        }
        return true
    }
}
