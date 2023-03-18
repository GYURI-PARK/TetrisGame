//
//  GameOver.swift
//  TetrisGame
//
//  Created by GYURI on 2023/03/16.
//

import Foundation
import SpriteKit

class GameOver: SKScene{
    
    // restart button 클릭 시 -> main scene으로 보내기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let location = touch?.location(in: self)
        let node = nodes(at: location!)
        for item in node{
            if item.name == "restart"{
                let scene = GameScene(size: view!.frame.size)
                scene.scaleMode = .aspectFill
                scene.anchorPoint = CGPoint(x: 0, y: 1)
                let transition = SKTransition.moveIn(with: .left, duration: 1)
                view!.presentScene(scene , transition: transition)
            }
        }
    }
}
