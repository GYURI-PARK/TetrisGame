//
//  NextBrick.swift
//  TetrisGame
//
//  Created by GYURI on 2023/03/18.
//

import Foundation
import SpriteKit

class NextBrick {
    
    func addBrick() {
        // 변수 초기화
        Variables.nodeGroup.removeAll()
        Variables.newBrickArrays.removeAll()
        
        var xValue : CGFloat = 0
        for i in 0..<10{
            xValue += 100
            brickGenerator(brickSpace: xValue)
        }
        for bricks in Variables.nodeGroup{
            for item in bricks{
                Variables.scene.addChild(item)
            }
        }
    }
    
    func brickGenerator(brickSpace : CGFloat){
        let yPosition : CGFloat = 50
        let blockValue = Brick().bricks()
        var nextBricksArrays = Array<SKSpriteNode>()
        for item in blockValue.points{
            let brick = SKSpriteNode()
            let x = item.x
            let y = item.y
            brick.size = CGSize(width: CGFloat(blockValue.brickSize / 2) - 2, height: CGFloat(blockValue.brickSize / 2) - 2)
            brick.color = blockValue.color
            brick.name = "nextBrick"
            let xValue = x * CGFloat(blockValue.brickSize / 2) + brickSpace - 50
            let yValue = y * CGFloat(blockValue.brickSize / 2) + yPosition
            brick.position = CGPoint(x: xValue, y: -yValue)
            nextBricksArrays.append(brick)
        }
        Variables.nodeGroup.append(nextBricksArrays)
        Variables.newBrickArrays.append(blockValue)
    }
}
